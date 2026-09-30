import 'package:flutter/material.dart';

import '../data/category_repository.dart';
import '../data/image_repository.dart';
import '../data/study_item_repository.dart';
import '../database/app_database.dart';
import '../utils/study_item_meta.dart';
import 'study_item_detail_page.dart';
import 'study_item_form_page.dart';

/// 某学科下的学习内容列表页。
///
/// 支持按内容类型、掌握程度、是否错题、是否收藏、难度以及分类进行基础筛选。
/// 列表数据通过 watchByFilters 实时刷新，软删除后自动从列表消失。
class StudyItemListPage extends StatefulWidget {
  const StudyItemListPage({
    super.key,
    required this.studyItemRepository,
    required this.categoryRepository,
    required this.imageRepository,
    required this.subject,
  });

  final StudyItemRepository studyItemRepository;
  final CategoryRepository categoryRepository;
  final ImageRepository imageRepository;
  final Subject subject;

  @override
  State<StudyItemListPage> createState() => _StudyItemListPageState();
}

class _StudyItemListPageState extends State<StudyItemListPage> {
  String? _contentTypeFilter;
  String? _masteryFilter;
  bool? _mistakeFilter;
  bool? _favoriteFilter;
  String? _difficultyFilter;
  String? _categoryFilter;

  List<Category> _categories = <Category>[];
  Map<String, String> _categoryNameById = <String, String>{};

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    final List<Category> list = await widget.categoryRepository.getBySubject(
      widget.subject.id,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _categories = list;
      _categoryNameById = <String, String>{
        for (final Category c in list) c.id: c.name,
      };
    });
  }

  void _resetFilters() {
    setState(() {
      _contentTypeFilter = null;
      _masteryFilter = null;
      _mistakeFilter = null;
      _favoriteFilter = null;
      _difficultyFilter = null;
      _categoryFilter = null;
    });
  }

  Future<void> _openForm({StudyItem? item}) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => StudyItemFormPage(
          studyItemRepository: widget.studyItemRepository,
          categoryRepository: widget.categoryRepository,
          subject: widget.subject,
          item: item,
        ),
      ),
    );
  }

  Future<void> _openDetail(StudyItem item) async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => StudyItemDetailPage(
          studyItemRepository: widget.studyItemRepository,
          categoryRepository: widget.categoryRepository,
          imageRepository: widget.imageRepository,
          subject: widget.subject,
          item: item,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.subject.name} · 学习内容'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.filter_alt_off_outlined),
            tooltip: '清除筛选',
            onPressed: _resetFilters,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          _FilterBar(
            categories: _categories,
            contentTypeFilter: _contentTypeFilter,
            masteryFilter: _masteryFilter,
            mistakeFilter: _mistakeFilter,
            favoriteFilter: _favoriteFilter,
            difficultyFilter: _difficultyFilter,
            categoryFilter: _categoryFilter,
            onContentTypeChanged: (String? v) =>
                setState(() => _contentTypeFilter = v),
            onMasteryChanged: (String? v) => setState(() => _masteryFilter = v),
            onMistakeChanged: (bool? v) => setState(() => _mistakeFilter = v),
            onFavoriteChanged: (bool? v) =>
                setState(() => _favoriteFilter = v),
            onDifficultyChanged: (String? v) =>
                setState(() => _difficultyFilter = v),
            onCategoryChanged: (String? v) =>
                setState(() => _categoryFilter = v),
          ),
          Expanded(
            child: StreamBuilder<List<StudyItem>>(
              stream: widget.studyItemRepository.watchByFilters(
                subjectId: widget.subject.id,
                categoryId: _categoryFilter,
                contentType: _contentTypeFilter,
                masteryLevel: _masteryFilter,
                isMistake: _mistakeFilter,
                isFavorite: _favoriteFilter,
                difficulty: _difficultyFilter,
              ),
              builder: (
                BuildContext context,
                AsyncSnapshot<List<StudyItem>> snapshot,
              ) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text('读取学习内容失败：${snapshot.error}'),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting &&
                    !snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final List<StudyItem> items = snapshot.data ?? <StudyItem>[];
                if (items.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        '该科目下还没有学习内容\n'
                        '点击右下角按钮新增习题 / 知识点 / 笔记',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (BuildContext context, int index) {
                    final StudyItem item = items[index];
                    final String? categoryName =
                        item.category_id == null
                            ? null
                            : _categoryNameById[item.category_id];
                    return ListTile(
                      leading: Icon(contentTypeIcon(item.content_type)),
                      title: Text(
                        item.title == null || item.title!.trim().isEmpty
                            ? '(无标题)'
                            : item.title!,
                      ),
                      subtitle: Text(
                        <String>[
                          contentTypeLabel(item.content_type),
                          if (categoryName != null) categoryName,
                          difficultyLabel(item.difficulty),
                        ].join(' · '),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.circle,
                            size: 12,
                            color: masteryLevelColor(item.mastery_level),
                          ),
                          const SizedBox(width: 6),
                          if (item.is_mistake == 1)
                            const Icon(Icons.error_outline,
                                size: 18, color: Colors.red),
                          if (item.is_favorite == 1)
                            const Icon(Icons.star,
                                size: 18, color: Colors.amber),
                        ],
                      ),
                      onTap: () => _openDetail(item),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _openForm(),
        icon: const Icon(Icons.add),
        label: const Text('新增学习内容'),
      ),
    );
  }
}

/// 学习内容列表顶部的基础筛选栏。
class _FilterBar extends StatelessWidget {
  const _FilterBar({
    required this.categories,
    required this.contentTypeFilter,
    required this.masteryFilter,
    required this.mistakeFilter,
    required this.favoriteFilter,
    required this.difficultyFilter,
    required this.categoryFilter,
    required this.onContentTypeChanged,
    required this.onMasteryChanged,
    required this.onMistakeChanged,
    required this.onFavoriteChanged,
    required this.onDifficultyChanged,
    required this.onCategoryChanged,
  });

  final List<Category> categories;
  final String? contentTypeFilter;
  final String? masteryFilter;
  final bool? mistakeFilter;
  final bool? favoriteFilter;
  final String? difficultyFilter;
  final String? categoryFilter;

  final ValueChanged<String?> onContentTypeChanged;
  final ValueChanged<String?> onMasteryChanged;
  final ValueChanged<bool?> onMistakeChanged;
  final ValueChanged<bool?> onFavoriteChanged;
  final ValueChanged<String?> onDifficultyChanged;
  final ValueChanged<String?> onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(12, 12, 12, 4),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Wrap(
          spacing: 12,
          runSpacing: 8,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: <Widget>[
            _CompactDropdown<String?>(
              label: '类型',
              value: contentTypeFilter,
              items: const <DropdownMenuItem<String?>>[
                DropdownMenuItem<String?>(value: null, child: Text('全部')),
                DropdownMenuItem<String?>(
                    value: 'question', child: Text('习题')),
                DropdownMenuItem<String?>(
                    value: 'knowledge', child: Text('知识点')),
                DropdownMenuItem<String?>(value: 'note', child: Text('笔记')),
              ],
              onChanged: onContentTypeChanged,
            ),
            _CompactDropdown<String?>(
              label: '掌握',
              value: masteryFilter,
              items: const <DropdownMenuItem<String?>>[
                DropdownMenuItem<String?>(value: null, child: Text('全部')),
                DropdownMenuItem<String?>(value: 'red', child: Text('不稳定')),
                DropdownMenuItem<String?>(value: 'yellow', child: Text('会一些')),
                DropdownMenuItem<String?>(value: 'green', child: Text('很稳定')),
              ],
              onChanged: onMasteryChanged,
            ),
            _CompactDropdown<String?>(
              label: '难度',
              value: difficultyFilter,
              items: const <DropdownMenuItem<String?>>[
                DropdownMenuItem<String?>(value: null, child: Text('全部')),
                DropdownMenuItem<String?>(value: 'easy', child: Text('简单')),
                DropdownMenuItem<String?>(value: 'medium', child: Text('中等')),
                DropdownMenuItem<String?>(value: 'hard', child: Text('困难')),
              ],
              onChanged: onDifficultyChanged,
            ),
            _CompactDropdown<String?>(
              label: '分类',
              value: categoryFilter,
              items: <DropdownMenuItem<String?>>[
                const DropdownMenuItem<String?>(value: null, child: Text('全部')),
                ...categories.map(
                  (Category c) => DropdownMenuItem<String?>(
                    value: c.id,
                    child: Text(c.name),
                  ),
                ),
              ],
              onChanged: onCategoryChanged,
            ),
            _CompactChip(
              label: '错题',
              value: mistakeFilter,
              onChanged: onMistakeChanged,
            ),
            _CompactChip(
              label: '收藏',
              value: favoriteFilter,
              onChanged: onFavoriteChanged,
            ),
          ],
        ),
      ),
    );
  }
}

/// 紧凑下拉筛选（带标签）。
class _CompactDropdown<T> extends StatelessWidget {
  const _CompactDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          value: value,
          isDense: true,
          items: items,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

/// 紧凑的布尔筛选（未选 / 是 / 否）。
class _CompactChip extends StatelessWidget {
  const _CompactChip({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool? value;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(label),
        const SizedBox(width: 4),
        DropdownButton<bool?>(
          value: value,
          underline: const SizedBox.shrink(),
          items: const <DropdownMenuItem<bool?>>[
            DropdownMenuItem<bool?>(value: null, child: Text('全部')),
            DropdownMenuItem<bool?>(value: true, child: Text('是')),
            DropdownMenuItem<bool?>(value: false, child: Text('否')),
          ],
          onChanged: onChanged,
        ),
      ],
    );
  }
}
