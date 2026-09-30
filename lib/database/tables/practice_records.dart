import 'package:drift/drift.dart';

/// practice_records 专项刷题题目记录表
///
/// 字段严格对应《个人智能考研复习APP需求与数据库设计》第四部分第 16 节
/// practice_records 专项刷题题目记录表：id、session_id、study_item_id、
/// result、response_time、created_at。
///
/// 用途区分：
/// practice_plans 保存专项刷题方案；
/// practice_sessions 保存一次完整刷题活动的汇总信息；
/// 本表保存该活动中每一道题的具体做题结果。
///
/// result 按 TEXT 保存（correct / wrong / hesitated / skipped），
/// 不添加 CHECK 约束、不定义 enum、不做业务校验。
/// response_time 为 INTEGER；created_at 保存毫秒级时间戳。
///
/// 全部字段非 nullable，不设置默认值；
/// 不加外键、CHECK、UNIQUE、额外索引或级联。
@DataClassName('PracticeRecord')
class PracticeRecords extends Table {
  /// 记录ID，主键
  TextColumn get id => text()();

  /// 刷题活动ID
  TextColumn get session_id => text()();

  /// 学习内容ID
  TextColumn get study_item_id => text()();

  /// 做题结果：correct / wrong / hesitated / skipped
  TextColumn get result => text()();

  /// 做题耗时
  IntColumn get response_time => integer()();

  /// 做题时间，毫秒级时间戳
  IntColumn get created_at => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
