import 'package:drift/drift.dart';

/// study_item_tags 内容标签关联表
///
/// 字段严格对应《个人智能考研复习APP需求与数据库设计》第四部分第 8 节
/// study_item_tags 内容标签关联表：study_item_id、tag_id。
///
/// 联合主键：study_item_id + tag_id，保证同一个学习内容不能重复绑定同一个标签。
///
/// 两个字段均非 nullable、无默认值。
/// 不添加外键、CHECK、UNIQUE、索引或级联；两个 ID 仅作为 TEXT 保存。
@DataClassName('StudyItemTagRecord')
class StudyItemTags extends Table {
  /// 学习内容ID
  TextColumn get study_item_id => text()();

  /// 标签ID
  TextColumn get tag_id => text()();

  @override
  Set<Column> get primaryKey => {study_item_id, tag_id};
}
