import 'package:drift/drift.dart';

/// practice_plans 专项刷题方案表
///
/// 字段严格对应《个人智能考研复习APP需求与数据库设计》第四部分第 14 节
/// practice_plans 专项刷题方案表：id、name、filter_config、question_count、
/// sort_type、created_at、updated_at。
///
/// filter_config 以 TEXT 保存 JSON 字符串；本表只负责保存，不解析 JSON，
/// 不做筛选与排序。filter_config 与 sort_type 均按 TEXT 保存，
/// 不引入 JSON 专用类型或额外的拆分字段。
///
/// created_at / updated_at 保存毫秒级时间戳。
///
/// 全部字段非 nullable，不设置默认值；
/// 不加外键、CHECK、UNIQUE、索引或级联。
@DataClassName('PracticePlan')
class PracticePlans extends Table {
  /// 方案ID，主键
  TextColumn get id => text()();

  /// 方案名称
  TextColumn get name => text()();

  /// JSON格式筛选条件
  TextColumn get filter_config => text()();

  /// 刷题数量
  IntColumn get question_count => integer()();

  /// 排序方式
  TextColumn get sort_type => text()();

  /// 创建时间，毫秒级时间戳
  IntColumn get created_at => integer()();

  /// 修改时间，毫秒级时间戳
  IntColumn get updated_at => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
