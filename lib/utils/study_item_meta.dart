import 'package:flutter/material.dart';

/// 学习内容展示用的静态元数据映射。
///
/// 仅用于 UI 标签与配色，不引入任何状态管理或业务逻辑。

/// content_type: question / knowledge / note
const Map<String, String> contentTypeLabels = <String, String>{
  'question': '习题',
  'knowledge': '知识点',
  'note': '笔记',
};

/// mastery_level: red / yellow / green
const Map<String, String> masteryLevelLabels = <String, String>{
  'red': '不稳定',
  'yellow': '会一些',
  'green': '很稳定',
};

const Map<String, Color> masteryLevelColors = <String, Color>{
  'red': Colors.red,
  'yellow': Colors.orange,
  'green': Colors.green,
};

/// difficulty: easy / medium / hard
const Map<String, String> difficultyLabels = <String, String>{
  'easy': '简单',
  'medium': '中等',
  'hard': '困难',
};

/// risk_level: low / medium / high / very_high
const Map<String, String> riskLevelLabels = <String, String>{
  'low': '低',
  'medium': '中',
  'high': '高',
  'very_high': '极高',
};

String contentTypeLabel(String value) =>
    contentTypeLabels[value] ?? value;

String masteryLevelLabel(String value) =>
    masteryLevelLabels[value] ?? value;

Color masteryLevelColor(String value) =>
    masteryLevelColors[value] ?? Colors.grey;

String difficultyLabel(String? value) =>
    value == null ? '未设置' : (difficultyLabels[value] ?? value);

String riskLevelLabel(String? value) =>
    value == null ? '未计算' : (riskLevelLabels[value] ?? value);

/// 内容类型对应的图标。
IconData contentTypeIcon(String value) {
  switch (value) {
    case 'question':
      return Icons.help_outline;
    case 'knowledge':
      return Icons.lightbulb_outline;
    case 'note':
      return Icons.note_outlined;
    default:
      return Icons.description_outlined;
  }
}
