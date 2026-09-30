import 'package:drift/drift.dart';

/// practice_sessions 专项刷题记录表
///
/// 字段严格对应《个人智能考研复习APP需求与数据库设计》第四部分第 15 节
/// practice_sessions 专项刷题记录表：id、plan_id、started_at、finished_at、
/// total_count、correct_count、wrong_count、skipped_count、hesitated_count、
/// total_time、average_time、count_as_review、created_at。
///
/// 用途区分：
/// practice_plans 保存刷题方案；本表保存一次实际刷题活动的汇总记录；
/// practice_records（后续阶段）保存该活动中每道题的具体结果。
///
/// started_at、finished_at、created_at 保存毫秒级时间戳。
/// average_time 为 REAL；count_as_review 按 INTEGER 保存，不使用 bool 类型。
///
/// 全部字段非 nullable，不设置默认值；
/// 不加外键、CHECK、UNIQUE、额外索引或级联。
@DataClassName('PracticeSession')
class PracticeSessions extends Table {
  /// 刷题活动ID，主键
  TextColumn get id => text()();

  /// 使用的方案
  TextColumn get plan_id => text()();

  /// 开始时间，毫秒级时间戳
  IntColumn get started_at => integer()();

  /// 结束时间，毫秒级时间戳
  IntColumn get finished_at => integer()();

  /// 总题数
  IntColumn get total_count => integer()();

  /// 正确数量
  IntColumn get correct_count => integer()();

  /// 错误数量
  IntColumn get wrong_count => integer()();

  /// 跳过数量
  IntColumn get skipped_count => integer()();

  /// 困难/犹豫数量
  IntColumn get hesitated_count => integer()();

  /// 总耗时
  IntColumn get total_time => integer()();

  /// 平均每题耗时
  RealColumn get average_time => real()();

  /// 是否计入复习系统
  IntColumn get count_as_review => integer()();

  /// 创建时间，毫秒级时间戳
  IntColumn get created_at => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
