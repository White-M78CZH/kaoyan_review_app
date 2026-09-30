import 'package:drift/drift.dart';

/// subjects 学科表
///
/// 字段严格对应《个人智能考研复习APP需求与数据库设计》第四部分第 3 节 subjects 学科表：
/// id TEXT 主键、name TEXT、description TEXT、sort_order INTEGER、
/// is_default INTEGER、created_at INTEGER、updated_at INTEGER。
///
/// sort_order 默认 0，is_default 默认 0，created_at / updated_at 保存毫秒级时间戳。
/// description 允许为空，因为学科描述在需求中未要求必填。
@DataClassName('Subject')
class Subjects extends Table {
  /// 学科ID，主键
  TextColumn get id => text()();

  /// 学科名称
  TextColumn get name => text()();

  /// 学科描述
  TextColumn get description => text().nullable()();

  /// 显示顺序，默认 0
  IntColumn get sort_order => integer().withDefault(const Constant(0))();

  /// 是否默认学科，0 否 / 1 是，默认 0
  IntColumn get is_default => integer().withDefault(const Constant(0))();

  /// 创建时间，毫秒级时间戳
  IntColumn get created_at => integer()();

  /// 修改时间，毫秒级时间戳
  IntColumn get updated_at => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
