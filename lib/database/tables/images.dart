import 'package:drift/drift.dart';

/// images 图片表
///
/// 字段严格对应《个人智能考研复习APP需求与数据库设计》第四部分第 6 节 images 图片表：
/// id、study_item_id、file_path、thumbnail_path、original_width、
/// original_height、file_size、sort_order、created_at。
///
/// 本表只保存图片元数据；图片文件本体保存在 APP 本地文件目录，不在数据库中。
/// created_at 保存毫秒级时间戳。
///
/// 全部字段非 nullable，不设置任何默认值，不加外键、CHECK、UNIQUE 或索引。
@DataClassName('ImageRecord')
class Images extends Table {
  /// 图片ID，主键
  TextColumn get id => text()();

  /// 所属学习内容
  TextColumn get study_item_id => text()();

  /// 原图路径
  TextColumn get file_path => text()();

  /// 缩略图路径
  TextColumn get thumbnail_path => text()();

  /// 原始宽度
  IntColumn get original_width => integer()();

  /// 原始高度
  IntColumn get original_height => integer()();

  /// 文件大小
  IntColumn get file_size => integer()();

  /// 图片顺序
  IntColumn get sort_order => integer()();

  /// 添加时间，毫秒级时间戳
  IntColumn get created_at => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
