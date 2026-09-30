import 'package:drift/drift.dart';

/// fsrs_cards FSRS 状态表
///
/// 字段严格对应《个人智能考研复习APP需求与数据库设计》第四部分第 9 节
/// fsrs_cards FSRS状态表：study_item_id、due、stability、difficulty、
/// elapsed_days、scheduled_days、reps、lapses、state、last_review、
/// created_at、updated_at。
///
/// due、last_review、created_at、updated_at 保存毫秒级时间戳。
/// stability、difficulty 为 REAL。
/// state 只保存 INTEGER，本表不定义枚举、映射或任何计算逻辑。
///
/// 仅 last_review 为 nullable；不设置任何默认值；不加外键、CHECK、UNIQUE 或索引。
@DataClassName('FsrsCardRecord')
class FsrsCards extends Table {
  /// 学习内容ID，主键
  TextColumn get study_item_id => text()();

  /// 下一次到期时间，毫秒级时间戳
  IntColumn get due => integer()();

  /// FSRS 稳定性
  RealColumn get stability => real()();

  /// FSRS 内部难度
  RealColumn get difficulty => real()();

  /// 距上次复习天数
  IntColumn get elapsed_days => integer()();

  /// 当前计划间隔
  IntColumn get scheduled_days => integer()();

  /// 复习次数
  IntColumn get reps => integer()();

  /// Again / 遗忘次数
  IntColumn get lapses => integer()();

  /// FSRS 状态
  IntColumn get state => integer()();

  /// 上一次复习时间，毫秒级时间戳；尚未复习过的新卡片为空
  IntColumn get last_review => integer().nullable()();

  /// 创建时间，毫秒级时间戳
  IntColumn get created_at => integer()();

  /// 修改时间，毫秒级时间戳
  IntColumn get updated_at => integer()();

  @override
  Set<Column> get primaryKey => {study_item_id};
}
