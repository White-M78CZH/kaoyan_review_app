import 'package:drift/drift.dart';

/// mistake_records 错题记录表
///
/// 字段严格对应《个人智能考研复习APP需求与数据库设计》第四部分第 11 节
/// mistake_records 错题表：id、study_item_id、first_marked_at、last_error_at、
/// error_count、last_error_reason、created_at、updated_at。
///
/// 用途区分：
/// study_items.is_mistake 表示学习内容当前是否被标记为错题；
/// 本表记录该学习内容独立的错题记录与错误统计。
/// 错题状态独立于高风险状态，也不保存 FSRS 状态。
///
/// first_marked_at、last_error_at、created_at、updated_at 保存毫秒级时间戳。
///
/// 不加外键、CHECK、UNIQUE、索引或级联，不设置默认值。
@DataClassName('MistakeRecord')
class MistakeRecords extends Table {
  /// 错题记录ID，主键
  TextColumn get id => text()();

  /// 学习内容ID
  TextColumn get study_item_id => text()();

  /// 首次标记时间，毫秒级时间戳
  IntColumn get first_marked_at => integer()();

  /// 最近错误时间，毫秒级时间戳
  IntColumn get last_error_at => integer()();

  /// 历史错误次数
  IntColumn get error_count => integer()();

  /// 最近错误原因摘要；尚未填写过错误原因时为空
  TextColumn get last_error_reason => text().nullable()();

  /// 创建时间，毫秒级时间戳
  IntColumn get created_at => integer()();

  /// 修改时间，毫秒级时间戳
  IntColumn get updated_at => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
