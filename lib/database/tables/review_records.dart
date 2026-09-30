import 'package:drift/drift.dart';

/// review_records 复习记录表
///
/// 字段严格对应《个人智能考研复习APP需求与数据库设计》第四部分第 10 节
/// review_records 复习记录表：id、study_item_id、review_time、rating、
/// response_time、previous_due、next_due、scheduled_days、is_overdue、created_at。
///
/// 用途区分：
/// fsrs_cards 保存每条学习内容的当前 FSRS 卡片状态；
/// review_records 保存每一次实际复习行为产生的历史记录。
///
/// review_time、previous_due、next_due、created_at 保存毫秒级时间戳。
/// rating 保存 Again / Hard / Good / Easy（按 TEXT 保存，不引入 enum）。
///
/// 全部字段非 nullable，无默认值；不加外键、CHECK、UNIQUE 或索引。
@DataClassName('ReviewRecord')
class ReviewRecords extends Table {
  /// 复习记录ID，主键
  TextColumn get id => text()();

  /// 学习内容ID
  TextColumn get study_item_id => text()();

  /// 复习时间，毫秒级时间戳
  IntColumn get review_time => integer()();

  /// 复习评价：Again / Hard / Good / Easy
  TextColumn get rating => text()();

  /// 复习耗时
  IntColumn get response_time => integer()();

  /// 复习前到期时间，毫秒级时间戳
  IntColumn get previous_due => integer()();

  /// 复习后时间，毫秒级时间戳
  IntColumn get next_due => integer()();

  /// 本次计划间隔
  IntColumn get scheduled_days => integer()();

  /// 是否逾期
  IntColumn get is_overdue => integer()();

  /// 创建时间，毫秒级时间戳
  IntColumn get created_at => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
