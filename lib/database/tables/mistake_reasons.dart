import 'package:drift/drift.dart';

/// mistake_reasons 错误原因表
///
/// 字段严格对应《个人智能考研复习APP需求与数据库设计》第四部分第 12 节
/// mistake_reasons 错误原因表：id、name、sort_order、is_default、created_at。
///
/// created_at 保存毫秒级时间戳。
///
/// 本表只定义表结构与字段，不在建表时插入任何默认错误原因数据；
/// 默认原因（概念不会、公式忘记、思路不会、方法选错、计算错误、看错题目、
/// 粗心、时间不够、其他）由后续初始化 / 业务阶段单独处理。
///
/// 全部字段非 nullable，不设置默认值；
/// 不加外键、CHECK、UNIQUE、索引或级联。
@DataClassName('MistakeReason')
class MistakeReasons extends Table {
  /// 原因ID，主键
  TextColumn get id => text()();

  /// 原因名称
  TextColumn get name => text()();

  /// 显示顺序
  IntColumn get sort_order => integer()();

  /// 是否默认原因
  IntColumn get is_default => integer()();

  /// 创建时间，毫秒级时间戳
  IntColumn get created_at => integer()();

  @override
  Set<Column> get primaryKey => {id};
}
