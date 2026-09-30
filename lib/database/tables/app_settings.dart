import 'package:drift/drift.dart';

/// app_settings APP设置表
///
/// 字段严格对应《个人智能考研复习APP需求与数据库设计》第四部分第 17 节
/// app_settings APP设置表：id、daily_review_limit、daily_new_limit、
/// default_sort_type、image_quality、generate_thumbnail、show_next_review_time、
/// count_practice_as_review、initial_red_days、initial_yellow_days、
/// initial_green_days、backup_reminder_days、theme_mode、updated_at。
///
/// id 为 INTEGER 主键，业务约定固定为 1；本次不在数据库层通过 CHECK / DEFAULT
/// 强制，也不自动插入任何默认设置记录，初始化与读写留给后续业务阶段。
///
/// updated_at 保存毫秒级时间戳。
/// theme_mode 按 TEXT 保存（system / light / dark），不添加 CHECK、不定义 enum。
/// generate_thumbnail、show_next_review_time、count_practice_as_review 等
/// 布尔语义字段均使用 INTEGER。
///
/// 全部字段非 nullable，不设置默认值；
/// 不加外键、CHECK、UNIQUE、额外索引、触发器或级联。
@DataClassName('AppSetting')
class AppSettings extends Table {
  /// 主键，业务约定固定为 1
  IntColumn get id => integer()();

  /// 每日复习上限
  IntColumn get daily_review_limit => integer()();

  /// 每日新内容上限
  IntColumn get daily_new_limit => integer()();

  /// 默认排序方式
  TextColumn get default_sort_type => text()();

  /// 图片压缩质量
  IntColumn get image_quality => integer()();

  /// 是否生成缩略图
  IntColumn get generate_thumbnail => integer()();

  /// 是否显示下一次复习时间
  IntColumn get show_next_review_time => integer()();

  /// 专项刷题是否计入复习
  IntColumn get count_practice_as_review => integer()();

  /// 红色首次复习间隔
  IntColumn get initial_red_days => integer()();

  /// 黄色首次复习间隔
  IntColumn get initial_yellow_days => integer()();

  /// 绿色首次复习间隔
  IntColumn get initial_green_days => integer()();

  /// 备份提醒周期
  IntColumn get backup_reminder_days => integer()();

  /// system / light / dark
  TextColumn get theme_mode => text()();

  /// 修改时间，毫秒级时间戳
  IntColumn get updated_at => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
