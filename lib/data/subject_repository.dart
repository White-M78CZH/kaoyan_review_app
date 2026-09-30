import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../utils/id_generator.dart';

/// subjects 表的轻量数据访问层。
///
/// 只负责 subjects 的查询与增删改，不含业务逻辑与状态管理。
class SubjectRepository {
  const SubjectRepository(this._db);

  final AppDatabase _db;

  /// 监听全部科目（按排序、名称）。
  Stream<List<Subject>> watchAll() {
    return (_db.select(_db.subjects)
          ..orderBy([
            (t) => OrderingTerm.asc(t.sort_order),
            (t) => OrderingTerm.asc(t.name),
          ]))
        .watch();
  }

  /// 按 id 读取科目，不存在返回 null。
  Future<Subject?> getById(String id) {
    return (_db.select(_db.subjects)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  /// 新增科目。
  ///
  /// is_default 固定为 0：不允许普通用户在界面上把科目标记成系统默认数据。
  Future<void> create({
    required String name,
    String? description,
    required int sortOrder,
  }) async {
    final int now = nowMillis();
    await _db
        .into(_db.subjects)
        .insert(
          SubjectsCompanion.insert(
            id: newId('subject'),
            name: name,
            description: Value<String?>(description),
            sort_order: Value<int>(sortOrder),
            is_default: const Value<int>(0),
            created_at: now,
            updated_at: now,
          ),
        );
  }

  /// 修改科目。只改 name / description / sort_order / updated_at，
  /// 不改动 id 与 created_at。
  Future<void> update({
    required String id,
    required String name,
    String? description,
    required int sortOrder,
  }) async {
    await (_db.update(_db.subjects)..where((t) => t.id.equals(id))).write(
      SubjectsCompanion(
        name: Value<String>(name),
        description: Value<String?>(description),
        sort_order: Value<int>(sortOrder),
        updated_at: Value<int>(nowMillis()),
      ),
    );
  }

  /// 删除科目（调用前请先用 countCategories / countStudyItems 做关联检查）。
  Future<void> delete(String id) async {
    await (_db.delete(_db.subjects)..where((t) => t.id.equals(id))).go();
  }

  /// 科目下的分类数量。
  Future<int> countCategories(String subjectId) async {
    final List<Category> rows =
        await (_db.select(_db.categories)
              ..where((t) => t.subject_id.equals(subjectId)))
            .get();
    return rows.length;
  }

  /// 科目下的学习内容数量。
  Future<int> countStudyItems(String subjectId) async {
    final List<StudyItem> rows =
        await (_db.select(_db.studyItems)
              ..where((t) => t.subject_id.equals(subjectId)))
            .get();
    return rows.length;
  }
}
