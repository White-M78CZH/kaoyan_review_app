import 'package:flutter/material.dart';

import '../data/category_repository.dart';
import '../data/study_item_repository.dart';
import '../database/app_database.dart';
import '../utils/study_item_meta.dart';
import 'study_item_form_page.dart';

/// 学习内容详情页。
///
/// 展示内容区与学习状态；提供编辑与删除（软删除，二次确认）。
/// 不展示尚未实现的图片 / FSRS / 复习记录 / 错题原因 / 专项刷题数据。
class StudyItemDetailPage extends StatefulWidget {
  const StudyItemDetailPage({
    super.key,
    required this.studyItemRepository,
    required this.categoryRepository,
    required this.subject,
    required this.item,
  });

  final StudyItemRepository studyItemRepository;
  final CategoryRepository categoryRepository;
  final Subject subject;
  final StudyItem item;

  @override
  State<StudyItemDetailPage> createState() => _StudyItemDetailPageState();
}

class _StudyItemDetailPageState extends State<StudyItemDetailPage> {
  late StudyItem _item;
  String? _categoryName;
  bool _loadingCategory = true;

  @override
  void initState() {
    super.initState();
    _item = widget.item;
    _loadCategoryName();
  }

  Future<void> _loadCategoryName() async {
    if (_item.category_id == null) {
      if (!mounted) {
        return;
      }
      setState(() => _loadingCategory = false);
      return;
    }
    final Category? category = await widget.categoryRepository.getById(
      _item.category_id!,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _categoryName = category?.name;
      _loadingCategory = false;
    });
  }

  Future<void> _openEdit() async {
    final dynamic result = await Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (_) => StudyItemFormPage(
          studyItemRepository: widget.studyItemRepository,
          categoryRepository: widget.categoryRepository,
          subject: widget.subject,
          item: _item,
        ),
      ),
    );
    if (result == true && mounted) {
      final StudyItem? updated =
          await widget.studyItemRepository.getById(_item.id);
      if (updated != null && mounted) {
        setState(() {
          _item = updated;
          _loadingCategory = true;
        });
        await _loadCategoryName();
      }
    }
  }

  Future<void> _confirmDelete() async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('删除学习内容'),
        content: const Text('确定删除这条学习内容吗？\n\n'
            '将使用软删除（数据保留在数据库中，仅不再显示），此操作可在后续阶段恢复。'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('取消'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('删除'),
          ),
        ],
      ),
    );
    if (confirmed != true) {
      return;
    }

    await widget.studyItemRepository.softDelete(_item.id);
    if (!mounted) {
      return;
    }
    Navigator.of(context).pop(true);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('已删除（软删除）')),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 84,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(child: Text(value.isEmpty ? '（空）' : value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final StudyItem item = _item;
    final Color masteryColor = masteryLevelColor(item.mastery_level);

    return Scaffold(
      appBar: AppBar(
        title: Text(contentTypeLabel(item.content_type)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            tooltip: '编辑',
            onPressed: _openEdit,
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            tooltip: '删除',
            onPressed: _confirmDelete,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _infoRow('标题', item.title ?? ''),
                  _infoRow('类型', contentTypeLabel(item.content_type)),
                  _infoRow('科目', widget.subject.name),
                  _infoRow(
                    '分类',
                    _loadingCategory
                        ? '加载中…'
                        : (_categoryName ?? '（未指定）'),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _infoRow('正文', item.content ?? ''),
                  _infoRow('我的解答', item.my_answer ?? ''),
                  _infoRow('标准答案', item.standard_answer ?? ''),
                  _infoRow('个人备注', item.personal_note ?? ''),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Text('掌握程度',
                          style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(width: 8),
                      Icon(Icons.circle, size: 14, color: masteryColor),
                      const SizedBox(width: 4),
                      Text(masteryLevelLabel(item.mastery_level)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  _infoRow('是否错题', item.is_mistake == 1 ? '是' : '否'),
                  _infoRow('是否收藏', item.is_favorite == 1 ? '是' : '否'),
                  _infoRow('难度', difficultyLabel(item.difficulty)),
                  _infoRow('风险等级', riskLevelLabel(item.risk_level)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
