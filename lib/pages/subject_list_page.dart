import 'package:flutter/material.dart';

import '../data/category_repository.dart';
import '../data/subject_repository.dart';
import '../database/app_database.dart';
import 'category_tree_page.dart';
import 'subject_form_page.dart';

/// 科目管理列表页：APP 当前阶段的主页。
class SubjectListPage extends StatelessWidget {
  const SubjectListPage({
    super.key,
    required this.subjectRepository,
    required this.categoryRepository,
  });

  final SubjectRepository subjectRepository;
  final CategoryRepository categoryRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('科目管理')),
      body: StreamBuilder<List<Subject>>(
        stream: subjectRepository.watchAll(),
        builder: (BuildContext context, AsyncSnapshot<List<Subject>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('读取科目失败：${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<Subject> subjects = snapshot.data ?? <Subject>[];
          if (subjects.isEmpty) {
            return const _EmptyHint(
              icon: Icons.menu_book_outlined,
              message: '还没有科目\n点击右下角按钮新增第一个科目',
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: subjects.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (BuildContext context, int index) {
              final Subject subject = subjects[index];
              final String? description =
                  (subject.description == null ||
                      subject.description!.trim().isEmpty)
                  ? null
                  : subject.description!.trim();

              return ListTile(
                leading: const Icon(Icons.menu_book_outlined),
                title: Text(subject.name),
                subtitle: Text(
                  '${description == null ? '' : '$description\n'}'
                  '排序 ${subject.sort_order}'
                  '${subject.is_default == 1 ? ' · 默认' : ''}',
                ),
                isThreeLine: description != null,
                trailing: PopupMenuButton<String>(
                  onSelected: (String value) {
                    if (value == 'edit') {
                      _openEdit(context, subject);
                    } else if (value == 'delete') {
                      _confirmDelete(context, subject);
                    }
                  },
                  itemBuilder: (_) => const <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(value: 'edit', child: Text('编辑')),
                    PopupMenuItem<String>(value: 'delete', child: Text('删除')),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (_) => CategoryTreePage(
                        subject: subject,
                        categoryRepository: categoryRepository,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openEdit(context, null),
        icon: const Icon(Icons.add),
        label: const Text('新增科目'),
      ),
    );
  }

  Future<void> _openEdit(BuildContext context, Subject? subject) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => SubjectFormPage(
          subjectRepository: subjectRepository,
          subject: subject,
        ),
      ),
    );
  }

  /// 删除前检查分类与学习内容，存在关联数据时禁止删除。
  Future<void> _confirmDelete(BuildContext context, Subject subject) async {
    final int categoryCount = await subjectRepository.countCategories(
      subject.id,
    );
    final int itemCount = await subjectRepository.countStudyItems(subject.id);
    if (!context.mounted) {
      return;
    }

    if (categoryCount > 0 || itemCount > 0) {
      await showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('无法删除'),
          content: Text(
            '科目「${subject.name}」下仍有 $categoryCount 个分类、$itemCount 条学习内容。\n\n'
            '请先处理这些数据后再删除科目，避免产生孤儿数据。',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('知道了'),
            ),
          ],
        ),
      );
      return;
    }

    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('删除科目'),
        content: Text('确定删除科目「${subject.name}」吗？此操作不可撤销。'),
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

    await subjectRepository.delete(subject.id);
    if (!context.mounted) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('已删除科目')));
  }
}

/// 空状态提示。
class _EmptyHint extends StatelessWidget {
  const _EmptyHint({required this.icon, required this.message});

  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, size: 56, color: Theme.of(context).hintColor),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
