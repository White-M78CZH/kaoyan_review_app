import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../utils/id_generator.dart';

/// categories 表的轻量数据访问层。
///
/// 负责分类树的查询与增删改，并维护 level 与父子关系；
/// 不含业务逻辑与状态管理。
class CategoryRepository {
  const CategoryRepository(this._db);

  final AppDatabase _db;

  /// 监听某个科目下的全部分类（扁平列表，由 UI 组装成树）。
  Stream<List<Category>> watchBySubject(String subjectId) {
    return (_db.select(_db.categories)
          ..where((t) => t.subject_id.equals(subjectId))
          ..orderBy([
            (t) => OrderingTerm.asc(t.level),
            (t) => OrderingTerm.asc(t.sort_order),
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  /// 读取某个科目下的全部分类。
  Future<List<Category>> getBySubject(String subjectId) {
    return (_db.select(_db.categories)
          ..where((t) => t.subject_id.equals(subjectId)))
        .get();
  }

  /// 按 id 读取分类，不存在返回 null。
  Future<Category?> getById(String id) {
    return (_db.select(_db.categories)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// 新增分类。
  ///
  /// parentId 为空表示一级分类（level = 1），否则 level = 父级 level + 1。
  Future<String> create({
    required String subjectId,
    String? parentId,
    required String name,
    String? description,
    required int sortOrder,
  }) async {
    final int now = nowMillis();
    final String id = newId('category');
    await _db
        .into(_db.categories)
        .insert(
          CategoriesCompanion.insert(
            id: id,
            subject_id: subjectId,
            parent_id: Value<String?>(parentId),
            name: name,
            level: await _levelOfChild(parentId),
            sort_order: sortOrder,
            description: Value<String?>(description),
            created_at: now,
            updated_at: now,
          ),
        );
    return id;
  }

  /// 修改分类。
  ///
  /// 允许改 name / description / sort_order / parent_id；
  /// 移动父节点后会同步刷新子孙节点的 level。
  Future<void> update({
    required String id,
    required String name,
    String? description,
    required int sortOrder,
    String? parentId,
  }) async {
    final int level = await _levelOfChild(parentId);
    await (_db.update(_db.categories)..where((t) => t.id.equals(id))).write(
      CategoriesCompanion(
        name: Value<String>(name),
        description: Value<String?>(description),
        sort_order: Value<int>(sortOrder),
        parent_id: Value<String?>(parentId),
        level: Value<int>(level),
        updated_at: Value<int>(nowMillis()),
      ),
    );
    await _refreshDescendantLevels(id, level);
  }

  /// 删除分类（调用前请先用 countChildren / countStudyItems 做关联检查）。
  Future<void> delete(String id) async {
    await (_db.delete(_db.categories)..where((t) => t.id.equals(id))).go();
  }

  /// 直接子分类数量。
  Future<int> countChildren(String categoryId) async {
    final List<Category> rows =
        await (_db.select(_db.categories)
              ..where((t) => t.parent_id.equals(categoryId)))
            .get();
    return rows.length;
  }

  /// 关联到该分类的学习内容数量。
  Future<int> countStudyItems(String categoryId) async {
    final List<StudyItem> rows =
        await (_db.select(_db.studyItems)
              ..where((t) => t.category_id.equals(categoryId)))
            .get();
    return rows.length;
  }

  /// 返回该分类自身及其全部子孙 id，用于避免循环引用。
  Future<Set<String>> selfAndDescendantIds(String categoryId) async {
    final Set<String> result = <String>{categoryId};
    final List<Category> children =
        await (_db.select(_db.categories)
              ..where((t) => t.parent_id.equals(categoryId)))
            .get();
    for (final Category child in children) {
      result.addAll(await selfAndDescendantIds(child.id));
    }
    return result;
  }

  /// 计算挂在 parentId 下的节点层级：根为 1，否则父级 + 1。
  Future<int> _levelOfChild(String? parentId) async {
    if (parentId == null) {
      return 1;
    }
    final Category? parent = await getById(parentId);
    if (parent == null) {
      return 1;
    }
    return parent.level + 1;
  }

  /// 递归刷新子孙节点的 level。
  Future<void> _refreshDescendantLevels(String parentId, int parentLevel) async {
    final List<Category> children =
        await (_db.select(_db.categories)
              ..where((t) => t.parent_id.equals(parentId)))
            .get();
    for (final Category child in children) {
      final int level = parentLevel + 1;
      if (child.level != level) {
        await (_db.update(_db.categories)
              ..where((t) => t.id.equals(child.id)))
            .write(CategoriesCompanion(level: Value<int>(level)));
      }
      await _refreshDescendantLevels(child.id, level);
    }
  }
}
