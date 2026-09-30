import 'dart:math';

/// 生成数据库记录使用的唯一 ID。
///
/// 前缀 + 微秒时间戳 + 随机数，保证本地单设备场景下不重复。
String newId(String prefix) {
  final Random random = Random();
  final String stamp = DateTime.now().microsecondsSinceEpoch.toRadixString(36);
  final String rand = random.nextInt(0x7fffffff).toRadixString(36);
  return '${prefix}_${stamp}_$rand';
}

/// 当前毫秒时间戳。
int nowMillis() => DateTime.now().millisecondsSinceEpoch;
