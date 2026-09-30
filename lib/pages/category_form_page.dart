import 'package:flutter/material.dart';

import '../data/category_repository.dart';
import '../database/app_database.dart';

/// 分类新增 / 编辑表单页。
///
/// 新增时自动设置 subject_id、parent_id、level、sort_order、id、时间戳。
/// 编辑时父分类候选会排除自身与其全部子孙，避免循环引用。
class CategoryFormPage extends StatefulWidget {
  const CategoryFormPage({
    super.key,
    required this.categoryRepository,
    required this.subjectId,
    this.category,
    this.parent,
  });

  final CategoryRepository categoryRepository;
  final String subjectId;

  /// 为空表示新增分类。
  final Category? category;

  /// 新增时的预设父分类，为空表示一级分类。
  final Category? parent;

  bool get isEdit => category != null;

  @override
  State<CategoryFormPage> createState() => _CategoryFormPageState();
}

class _CategoryFormPageState extends State<CategoryFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _sortOrderController;

  bool _loading = true;
  bool _saving = false;
  String? _error;

  List<Category> _parentOptions = <Category>[];
  String? _parentId;
  String? _parentName;

  @override
  void initState() {
    super.initState();
    final Category? category = widget.category;
    _nameController = TextEditingController(text: category?.name ?? '');
    _descriptionController = TextEditingController(
      text: category?.description ?? '',
    );
    _sortOrderController = TextEditingController(
      text: category == null ? '0' : category.sort_order.toString(),
    );
    _parentId = category?.parent_id ?? widget.parent?.id;
    _parentName = widget.parent?.name;
    _loadParentOptions();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _sortOrderController.dispose();
    super.dispose();
  }

  Future<void> _loadParentOptions() async {
    final List<Category> all = await widget.categoryRepository.getBySubject(
      widget.subjectId,
    );
    final Set<String> banned = widget.category == null
        ? <String>{}
        : await widget.categoryRepository.selfAndDescendantIds(
            widget.category!.id,
          );

    final List<Category> options = all
        .where((Category c) => !banned.contains(c.id))
        .toList()
      ..sort((Category a, Category b) {
        final int byLevel = a.level.compareTo(b.level);
        if (byLevel != 0) {
          return byLevel;
        }
        final int bySort = a.sort_order.compareTo(b.sort_order);
        return bySort != 0 ? bySort : a.name.compareTo(b.name);
      });

    if (!mounted) {
      return;
    }
    setState(() {
      _parentOptions = options;
      _loading = false;
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });

    final String name = _nameController.text.trim();
    final String descriptionText = _descriptionController.text.trim();
    final int sortOrder =
        int.tryParse(_sortOrderController.text.trim()) ??
        (widget.category?.sort_order ?? 0);
    final String? description = descriptionText.isEmpty ? null : descriptionText;

    try {
      if (widget.isEdit) {
        await widget.categoryRepository.update(
          id: widget.category!.id,
          name: name,
          description: description,
          sortOrder: sortOrder,
          parentId: _parentId,
        );
      } else {
        await widget.categoryRepository.create(
          subjectId: widget.subjectId,
          parentId: _parentId,
          name: name,
          description: description,
          sortOrder: sortOrder,
        );
      }
      if (!mounted) {
        return;
      }
      Navigator.of(context).pop(true);
    } catch (e) {
      if (!mounted) {
        return;
      }
      setState(() {
        _saving = false;
        _error = '保存失败：$e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.isEdit ? '编辑分类' : '新增分类')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: '分类名称',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return '请输入分类名称';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: '分类描述（可选）',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  minLines: 2,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _sortOrderController,
                  decoration: const InputDecoration(
                    labelText: '排序值（数字，越小越靠前）',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                _loading
                    ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : DropdownButtonFormField<String?>(
                        initialValue: _parentId,
                        decoration: const InputDecoration(
                          labelText: '父分类',
                          border: OutlineInputBorder(),
                        ),
                        items: <DropdownMenuItem<String?>>[
                          const DropdownMenuItem<String?>(
                            value: null,
                            child: Text('无（作为一级分类）'),
                          ),
                          ..._parentOptions.map(
                            (Category c) => DropdownMenuItem<String?>(
                              value: c.id,
                              child: Text('${'    ' * (c.level - 1)}${c.name}'),
                            ),
                          ),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            _parentId = value;
                          });
                        },
                      ),
                if (widget.category != null && _parentName != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text('原父分类：$_parentName'),
                  ),
                const SizedBox(height: 24),
                if (_error != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      _error!,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                  ),
                FilledButton(
                  onPressed: _saving ? null : _save,
                  child: _saving
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('保存'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
