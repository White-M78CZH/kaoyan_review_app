import 'package:drift/drift.dart';

/// study_items 学习内容表
///
/// 字段严格对应《个人智能考研复习APP需求与数据库设计》第四部分第 5 节 study_items 学习内容表：
/// id、content_type、title、subject_id、category_id、content、my_answer、
/// standard_answer、personal_note、mastery_level、is_mistake、is_favorite、
/// difficulty、risk_level、created_at、updated_at、deleted_at。
///
/// created_at / updated_at / deleted_at 保存毫秒级时间戳。
/// content_type 保存 question / knowledge / note
/// mastery_level 保存 red / yellow / green
/// difficulty 保存 easy / medium / hard
/// risk_level 保存 low / medium / high / very_high
/// 以上均按 TEXT 原样保存，不引入 enum、CHECK 约束或映射表。
///
/// nullable 依据需求文档第 25 节「快速添加」：
/// 不要求首次录入必须填写标题、答案、备注、标签，允许先保存后完善。
@DataClassName('StudyItem')
class StudyItems extends Table {
  /// 学习内容ID，主键
  TextColumn get id => text()();

  /// question / knowledge / note
  TextColumn get content_type => text()();

  /// 标题
  TextColumn get title => text().nullable()();

  /// 所属学科
  TextColumn get subject_id => text()();

  /// 所属分类
  TextColumn get category_id => text().nullable()();

  /// 正文内容
  TextColumn get content => text().nullable()();

  /// 我的解答
  TextColumn get my_answer => text().nullable()();

  /// 标准答案
  TextColumn get standard_answer => text().nullable()();

  /// 个人备注
  TextColumn get personal_note => text().nullable()();

  /// red / yellow / green
  TextColumn get mastery_level => text()();

  /// 是否错题
  IntColumn get is_mistake => integer()();

  /// 是否收藏
  IntColumn get is_favorite => integer()();

  /// easy / medium / hard
  TextColumn get difficulty => text().nullable()();

  /// low / medium / high / very_high
  TextColumn get risk_level => text().nullable()();

  /// 创建时间，毫秒级时间戳
  IntColumn get created_at => integer()();

  /// 修改时间，毫秒级时间戳
  IntColumn get updated_at => integer()();

  /// 删除时间，毫秒级时间戳，未删除为空
  IntColumn get deleted_at => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
