import 'package:drift/drift.dart';

/// categories 分类表
///
/// 字段严格对应《个人智能考研复习APP需求与数据库设计》第四部分第 4 节 categories 分类表：
/// id、subject_id、parent_id、name、level、sort_order、description、
/// created_at、updated_at。
///
/// created_at / updated_at 保存毫秒级时间戳。
///
/// nullable：仅 parent_id、description 两列。
/// 不添加外键、CHECK、UNIQUE、索引、enum 或任何级联约束。
@DataClassName('Category')
class Categories extends Table {
  /// 分类ID，主键
  TextColumn get id => text()();

  /// 所属学科
  TextColumn get subject_id => text()();

  /// 父分类ID，顶级分类为空
  TextColumn get parent_id => text().nullable()();

  /// 分类名称
  TextColumn get name => text()();

  /// 分类层级
  IntColumn get level => integer()();

  /// 同级排序
  IntColumn get sort_order => integer()();

  /// 分类描述
  TextColumn get description => text().nullable()();

  /// 创建时间，毫秒级时间戳
  IntColumn get created_at => integer()();

  /// 修改时间，毫秒级时间戳
  IntColumn get updated_at => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
