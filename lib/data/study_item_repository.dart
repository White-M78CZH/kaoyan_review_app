import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../utils/id_generator.dart';

/// study_items 表的轻量数据访问层。
///
/// 只负责学习内容的查询与增删改，不含业务逻辑与状态管理。
/// 删除采用软删除（设置 deleted_at），不物理删除记录。
class StudyItemRepository {
  const StudyItemRepository(this._db);

  final AppDatabase _db;

  /// 按 id 读取未删除学习内容，不存在返回 null。
  Future<StudyItem?> getById(String id) {
    return (_db.select(_db.studyItems)
          ..where((t) => t.id.equals(id))
          ..where((t) => t.deleted_at.isNull()))
        .getSingleOrNull();
  }

  /// 监听全部未删除学习内容（按更新时间倒序）。
  Stream<List<StudyItem>> watchAll() {
    final q = _db.select(_db.studyItems)
      ..where((t) => t.deleted_at.isNull())
      ..orderBy([
        (t) => OrderingTerm.desc(t.updated_at),
        (t) => OrderingTerm.desc(t.created_at),
      ]);
    return q.watch();
  }

  /// 按学科监听未删除学习内容。
  Stream<List<StudyItem>> watchBySubject(String subjectId) {
    final q = _db.select(_db.studyItems)
      ..where((t) => t.deleted_at.isNull())
      ..where((t) => t.subject_id.equals(subjectId))
      ..orderBy([
        (t) => OrderingTerm.desc(t.updated_at),
        (t) => OrderingTerm.desc(t.created_at),
      ]);
    return q.watch();
  }

  /// 按分类监听未删除学习内容。
  Stream<List<StudyItem>> watchByCategory(String categoryId) {
    final q = _db.select(_db.studyItems)
      ..where((t) => t.deleted_at.isNull())
      ..where((t) => t.category_id.equals(categoryId))
      ..orderBy([
        (t) => OrderingTerm.desc(t.updated_at),
        (t) => OrderingTerm.desc(t.created_at),
      ]);
    return q.watch();
  }

  /// 组合筛选监听：适合页面实时列表使用。
  ///
  /// 任意筛选参数为 null 表示不限制该维度。
  Stream<List<StudyItem>> watchByFilters({
    String? subjectId,
    String? categoryId,
    String? contentType,
    String? masteryLevel,
    bool? isMistake,
    bool? isFavorite,
    String? difficulty,
  }) {
    final q = _db.select(_db.studyItems)
      ..where((t) => t.deleted_at.isNull());
    if (subjectId != null) {
      q.where((t) => t.subject_id.equals(subjectId));
    }
    if (categoryId != null) {
      q.where((t) => t.category_id.equals(categoryId));
    }
    if (contentType != null) {
      q.where((t) => t.content_type.equals(contentType));
    }
    if (masteryLevel != null) {
      q.where((t) => t.mastery_level.equals(masteryLevel));
    }
    if (isMistake != null) {
      q.where((t) => t.is_mistake.equals(isMistake ? 1 : 0));
    }
    if (isFavorite != null) {
      q.where((t) => t.is_favorite.equals(isFavorite ? 1 : 0));
    }
    if (difficulty != null) {
      q.where((t) => t.difficulty.equals(difficulty));
    }
    q.orderBy([
      (t) => OrderingTerm.desc(t.updated_at),
      (t) => OrderingTerm.desc(t.created_at),
    ]);
    return q.watch();
  }

  /// 新增学习内容。
  ///
  /// 自动生成 id / created_at / updated_at。
  /// mastery_level 由调用方给出合理默认值（本阶段默认 'red'）。
  /// is_mistake / is_favorite 由 bool 转为 0/1。
  /// risk_level 本阶段不自动计算，按传入值（可为 null）保存。
  Future<void> create({
    required String contentType,
    required String subjectId,
    String? title,
    String? categoryId,
    String? content,
    String? myAnswer,
    String? standardAnswer,
    String? personalNote,
    required String masteryLevel,
    required bool isMistake,
    required bool isFavorite,
    String? difficulty,
    String? riskLevel,
  }) async {
    final int now = nowMillis();
    await _db.into(_db.studyItems).insert(
          StudyItemsCompanion.insert(
            id: newId('item'),
            content_type: contentType,
            title: Value<String?>(title),
            subject_id: subjectId,
            category_id: Value<String?>(categoryId),
            content: Value<String?>(content),
            my_answer: Value<String?>(myAnswer),
            standard_answer: Value<String?>(standardAnswer),
            personal_note: Value<String?>(personalNote),
            mastery_level: masteryLevel,
            is_mistake: isMistake ? 1 : 0,
            is_favorite: isFavorite ? 1 : 0,
            difficulty: Value<String?>(difficulty),
            risk_level: Value<String?>(riskLevel),
            created_at: now,
            updated_at: now,
          ),
        );
  }

  /// 修改学习内容。
  ///
  /// 只改业务字段与 updated_at；不改动 id / created_at / deleted_at。
  Future<void> update({
    required String id,
    required String contentType,
    required String subjectId,
    String? title,
    String? categoryId,
    String? content,
    String? myAnswer,
    String? standardAnswer,
    String? personalNote,
    required String masteryLevel,
    required bool isMistake,
    required bool isFavorite,
    String? difficulty,
    String? riskLevel,
  }) async {
    await (_db.update(_db.studyItems)
          ..where((t) => t.id.equals(id)))
        .write(
      StudyItemsCompanion(
        content_type: Value<String>(contentType),
        title: Value<String?>(title),
        subject_id: Value<String>(subjectId),
        category_id: Value<String?>(categoryId),
        content: Value<String?>(content),
        my_answer: Value<String?>(myAnswer),
        standard_answer: Value<String?>(standardAnswer),
        personal_note: Value<String?>(personalNote),
        mastery_level: Value<String>(masteryLevel),
        is_mistake: Value<int>(isMistake ? 1 : 0),
        is_favorite: Value<int>(isFavorite ? 1 : 0),
        difficulty: Value<String?>(difficulty),
        risk_level: Value<String?>(riskLevel),
        updated_at: Value<int>(nowMillis()),
      ),
    );
  }

  /// 软删除：仅设置 deleted_at，不物理删除记录。
  ///
  /// 保留记录以便后续关联数据（images / tags / FSRS 等）迁移与清理。
  Future<void> softDelete(String id) async {
    await (_db.update(_db.studyItems)
          ..where((t) => t.id.equals(id)))
        .write(StudyItemsCompanion(deleted_at: Value<int>(nowMillis())));
  }
}
