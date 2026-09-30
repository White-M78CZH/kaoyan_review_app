import 'package:drift/drift.dart';

/// mistake_record_reasons 错误原因关联表
///
/// 字段严格对应《个人智能考研复习APP需求与数据库设计》第四部分第 13 节
/// mistake_record_reasons 错误原因关联表：mistake_record_id、reason_id。
///
/// 联合主键：mistake_record_id + reason_id，实现
/// mistake_records ↔ mistake_reasons 的多对多关联，
/// 保证同一条错题记录不会重复关联同一个错误原因。
///
/// 两个字段均为 TEXT、非 nullable、无默认值，不设置单独的 id。
/// 不添加外键、CHECK、UNIQUE、额外索引或级联。
@DataClassName('MistakeRecordReason')
class MistakeRecordReasons extends Table {
  /// 错误记录ID
  TextColumn get mistake_record_id => text()();

  /// 错误原因ID
  TextColumn get reason_id => text()();

  @override
  Set<Column> get primaryKey => {mistake_record_id, reason_id};
}
