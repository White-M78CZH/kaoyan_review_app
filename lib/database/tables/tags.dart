import 'package:drift/drift.dart';

/// tags 标签表
///
/// 字段严格对应《个人智能考研复习APP需求与数据库设计》第四部分第 7 节 tags 标签表：
/// id、name、created_at、updated_at。
///
/// created_at / updated_at 保存毫秒级时间戳。
///
/// 全部字段非 nullable，无默认值，不加 CHECK、UNIQUE、索引或外键。
@DataClassName('TagRecord')
class Tags extends Table {
  /// 标签ID，主键
  TextColumn get id => text()();

  /// 标签名称
  TextColumn get name => text()();

  /// 创建时间，毫秒级时间戳
  IntColumn get created_at => integer()();

  /// 修改时间，毫秒级时间戳
  IntColumn get updated_at => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
