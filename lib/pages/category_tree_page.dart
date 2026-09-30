import 'package:flutter/material.dart';

import '../data/category_repository.dart';
import '../data/study_item_repository.dart';
import '../database/app_database.dart';
import 'category_form_page.dart';
import 'study_item_list_page.dart';

/// 某个科目下的分类树管理页。
///
/// 层级不写死为两级：数据由父子关系递归展开，任意层级都能显示。
class CategoryTreePage extends StatelessWidget {
  const CategoryTreePage({
    super.key,
    required this.subject,
    required this.categoryRepository,
    required this.studyItemRepository,
  });

  final Subject subject;
  final CategoryRepository categoryRepository;
  final StudyItemRepository studyItemRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${subject.name} · 分类'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.library_books_outlined),
            tooltip: '学习内容',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => StudyItemListPage(
                    studyItemRepository: studyItemRepository,
                    categoryRepository: categoryRepository,
                    subject: subject,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Category>>(
        stream: categoryRepository.watchBySubject(subject.id),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Category>> snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(child: Text('读取分类失败：${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting &&
              !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<Category> categories = snapshot.data ?? <Category>[];
          if (categories.isEmpty) {
            return const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: Text(
                  '该科目下还没有分类\n点击右下角按钮新增一级分类',
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }

          final List<_CategoryNode> nodes = _flatten(categories);

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: nodes.length,
            itemBuilder: (BuildContext context, int index) {
              final _CategoryNode node = nodes[index];
              final Category category = node.category;
              final String? description =
                  (category.description == null ||
                      category.description!.trim().isEmpty)
                  ? null
                  : category.description!.trim();

              return Padding(
                padding: EdgeInsets.only(left: 20.0 * node.depth),
                child: ListTile(
                  leading: Icon(
                    node.depth == 0
                        ? Icons.folder_open_outlined
                        : Icons.subdirectory_arrow_right,
                  ),
                  title: Text(category.name),
                  subtitle: Text(
                    '${description == null ? '' : '$description\n'}'
                    '层级 ${category.level} · 排序 ${category.sort_order}',
                  ),
                  isThreeLine: description != null,
                  trailing: PopupMenuButton<String>(
                    onSelected: (String value) {
                      if (value == 'add') {
                        _openForm(context, null, category);
                      } else if (value == 'edit') {
                        _openForm(context, category, null);
                      } else if (value == 'delete') {
                        _confirmDelete(context, category);
                      }
                    },
                    itemBuilder: (_) => const <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'add',
                        child: Text('新增子分类'),
                      ),
                      PopupMenuItem<String>(value: 'edit', child: Text('编辑')),
                      PopupMenuItem<String>(value: 'delete', child: Text('删除')),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openForm(context, null, null),
        icon: const Icon(Icons.add),
        label: const Text('新增一级分类'),
      ),
    );
  }

  Future<void> _openForm(
    BuildContext context,
    Category? category,
    Category? parent,
  ) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => CategoryFormPage(
          categoryRepository: categoryRepository,
          subjectId: subject.id,
          category: category,
          parent: parent,
        ),
      ),
    );
  }

  /// 删除前检查子分类与学习内容，存在关联数据时禁止删除。
  Future<void> _confirmDelete(BuildContext context, Category category) async {
    final int childCount = await categoryRepository.countChildren(category.id);
    final int itemCount = await categoryRepository.countStudyItems(
      category.id,
    );
    if (!context.mounted) {
      return;
    }

    if (childCount > 0 || itemCount > 0) {
      await showDialog<void>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('无法删除'),
          content: Text(
            '分类「${category.name}」下仍有 $childCount 个子分类、$itemCount 条学习内容。\n\n'
            '请先处理这些数据后再删除分类，避免产生孤儿数据。',
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
        title: const Text('删除分类'),
        content: Text('确定删除分类「${category.name}」吗？此操作不可撤销。'),
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

    await categoryRepository.delete(category.id);
    if (!context.mounted) {
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('已删除分类')));
  }
}

/// 树节点，携带展示用的层级深度。
class _CategoryNode {
  const _CategoryNode({required this.category, required this.depth});

  final Category category;
  final int depth;
}

/// 把扁平分类列表递归展开为带深度的展示顺序。
List<_CategoryNode> _flatten(List<Category> categories) {
  final Map<String?, List<Category>> childrenOf = <String?, List<Category>>{};
  for (final Category category in categories) {
    childrenOf
        .putIfAbsent(category.parent_id, () => <Category>[])
        .add(category);
  }

  final List<_CategoryNode> nodes = <_CategoryNode>[];
  final Set<String> visited = <String>{};

  void walk(String? parentId, int depth) {
    final List<Category>? children = childrenOf[parentId];
    if (children == null || children.isEmpty) {
      return;
    }
    final List<Category> sorted = List<Category>.of(children)
      ..sort((Category a, Category b) {
        final int bySort = a.sort_order.compareTo(b.sort_order);
        return bySort != 0 ? bySort : a.name.compareTo(b.name);
      });
    for (final Category category in sorted) {
      if (!visited.add(category.id)) {
        continue;
      }
      nodes.add(_CategoryNode(category: category, depth: depth));
      walk(category.id, depth + 1);
    }
  }

  walk(null, 0);

  // 父级缺失（例如父分类被外部删除）的节点兜底展示，避免数据不可见。
  for (final Category category in categories) {
    if (!visited.contains(category.id)) {
      nodes.add(_CategoryNode(category: category, depth: 0));
    }
  }

  return nodes;
}
