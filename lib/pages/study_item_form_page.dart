import 'package:flutter/material.dart';

import '../data/category_repository.dart';
import '../data/study_item_repository.dart';
import '../database/app_database.dart';
import '../utils/study_item_meta.dart';

/// 学习内容新增 / 编辑表单页。
///
/// 遵循需求「快速添加」原则：标题、我的解答、标准答案、个人备注均不强制；
/// 科目由进入页面时固定的 subject 决定；分类限定在当前科目下。
/// 掌握程度默认为 'red'（新内容尚未稳定），可改为 yellow / green。
/// 风险等级本阶段不自动计算，仅展示已有值，不在表单中让用户手动配置。
class StudyItemFormPage extends StatefulWidget {
  const StudyItemFormPage({
    super.key,
    required this.studyItemRepository,
    required this.categoryRepository,
    required this.subject,
    this.item,
  });

  final StudyItemRepository studyItemRepository;
  final CategoryRepository categoryRepository;
  final Subject subject;

  /// 为空表示新增，否则为编辑。
  final StudyItem? item;

  bool get isEdit => item != null;

  @override
  State<StudyItemFormPage> createState() => _StudyItemFormPageState();
}

class _StudyItemFormPageState extends State<StudyItemFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String _contentType;
  late final TextEditingController _titleController;
  late final TextEditingController _contentController;
  late final TextEditingController _myAnswerController;
  late final TextEditingController _standardAnswerController;
  late final TextEditingController _personalNoteController;

  late String _masteryLevel;
  late bool _isMistake;
  late bool _isFavorite;
  String? _difficulty;
  String? _categoryId;

  List<Category> _categories = <Category>[];
  bool _loading = true;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    final StudyItem? item = widget.item;
    _contentType = item?.content_type ?? 'question';
    _titleController = TextEditingController(text: item?.title ?? '');
    _contentController = TextEditingController(text: item?.content ?? '');
    _myAnswerController = TextEditingController(text: item?.my_answer ?? '');
    _standardAnswerController =
        TextEditingController(text: item?.standard_answer ?? '');
    _personalNoteController =
        TextEditingController(text: item?.personal_note ?? '');
    _masteryLevel = item?.mastery_level ?? 'red';
    _isMistake = item?.is_mistake == 1;
    _isFavorite = item?.is_favorite == 1;
    _difficulty = item?.difficulty;
    _categoryId = item?.category_id;
    _loadCategories();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _myAnswerController.dispose();
    _standardAnswerController.dispose();
    _personalNoteController.dispose();
    super.dispose();
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
      _loading = false;
    });
  }

  String? _nullIfBlank(String value) {
    final String trimmed = value.trim();
    return trimmed.isEmpty ? null : trimmed;
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });

    final String? title = _nullIfBlank(_titleController.text);
    final String? content = _nullIfBlank(_contentController.text);
    final String? myAnswer = _nullIfBlank(_myAnswerController.text);
    final String? standardAnswer =
        _nullIfBlank(_standardAnswerController.text);
    final String? personalNote = _nullIfBlank(_personalNoteController.text);

    try {
      if (widget.isEdit) {
        await widget.studyItemRepository.update(
          id: widget.item!.id,
          contentType: _contentType,
          subjectId: widget.subject.id,
          title: title,
          categoryId: _categoryId,
          content: content,
          myAnswer: myAnswer,
          standardAnswer: standardAnswer,
          personalNote: personalNote,
          masteryLevel: _masteryLevel,
          isMistake: _isMistake,
          isFavorite: _isFavorite,
          difficulty: _difficulty,
          riskLevel: widget.item!.risk_level,
        );
      } else {
        await widget.studyItemRepository.create(
          contentType: _contentType,
          subjectId: widget.subject.id,
          title: title,
          categoryId: _categoryId,
          content: content,
          myAnswer: myAnswer,
          standardAnswer: standardAnswer,
          personalNote: personalNote,
          masteryLevel: _masteryLevel,
          isMistake: _isMistake,
          isFavorite: _isFavorite,
          difficulty: _difficulty,
          riskLevel: null,
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
      appBar: AppBar(
        title: Text(widget.isEdit ? '编辑学习内容' : '新增学习内容'),
      ),
      body: SafeArea(
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      _SectionCard(
                        title: '内容类型',
                        child: DropdownButtonFormField<String>(
                          value: _contentType,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          items: const <DropdownMenuItem<String>>[
                            DropdownMenuItem<String>(
                                value: 'question', child: Text('习题')),
                            DropdownMenuItem<String>(
                                value: 'knowledge', child: Text('知识点')),
                            DropdownMenuItem<String>(
                                value: 'note', child: Text('笔记')),
                          ],
                          onChanged: (String? v) {
                            if (v != null) {
                              setState(() => _contentType = v);
                            }
                          },
                        ),
                      ),
                      _SectionCard(
                        title: '基础信息',
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _titleController,
                              decoration: const InputDecoration(
                                labelText: '标题（可选）',
                                border: OutlineInputBorder(),
                              ),
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 12),
                            InputDecorator(
                              decoration: const InputDecoration(
                                labelText: '科目',
                                border: OutlineInputBorder(),
                              ),
                              child: Text(widget.subject.name),
                            ),
                            const SizedBox(height: 12),
                            DropdownButtonFormField<String?>(
                              value: _categoryId,
                              decoration: const InputDecoration(
                                labelText: '分类（可选，限定在当前科目下）',
                                border: OutlineInputBorder(),
                              ),
                              items: <DropdownMenuItem<String?>>[
                                const DropdownMenuItem<String?>(
                                  value: null,
                                  child: Text('不指定分类'),
                                ),
                                ..._categories.map(
                                  (Category c) => DropdownMenuItem<String?>(
                                    value: c.id,
                                    child: Text(
                                      '${'    ' * (c.level - 1)}${c.name}',
                                    ),
                                  ),
                                ),
                              ],
                              onChanged: (String? v) {
                                setState(() => _categoryId = v);
                              },
                            ),
                          ],
                        ),
                      ),
                      _SectionCard(
                        title: '内容',
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _contentController,
                              decoration: const InputDecoration(
                                labelText: '正文（可选）',
                                border: OutlineInputBorder(),
                                alignLabelWithHint: true,
                              ),
                              maxLines: 5,
                              minLines: 2,
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _myAnswerController,
                              decoration: const InputDecoration(
                                labelText: '我的解答（可选）',
                                border: OutlineInputBorder(),
                                alignLabelWithHint: true,
                              ),
                              maxLines: 4,
                              minLines: 1,
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _standardAnswerController,
                              decoration: const InputDecoration(
                                labelText: '标准答案（可选）',
                                border: OutlineInputBorder(),
                                alignLabelWithHint: true,
                              ),
                              maxLines: 4,
                              minLines: 1,
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                              controller: _personalNoteController,
                              decoration: const InputDecoration(
                                labelText: '个人备注（可选）',
                                border: OutlineInputBorder(),
                                alignLabelWithHint: true,
                              ),
                              maxLines: 4,
                              minLines: 1,
                            ),
                          ],
                        ),
                      ),
                      _SectionCard(
                        title: '学习状态',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text('掌握程度'),
                            const SizedBox(height: 6),
                            SegmentedButton<String>(
                              segments: const <ButtonSegment<String>>[
                                ButtonSegment<String>(
                                    value: 'red',
                                    label: Text('不稳定'),
                                    icon: Icon(Icons.circle, size: 14)),
                                ButtonSegment<String>(
                                    value: 'yellow',
                                    label: Text('会一些')),
                                ButtonSegment<String>(
                                    value: 'green',
                                    label: Text('很稳定')),
                              ],
                              selected: <String>{_masteryLevel},
                              onSelectionChanged:
                                  (Set<String> selected) {
                                setState(() => _masteryLevel = selected.first);
                              },
                            ),
                            const SizedBox(height: 12),
                            SwitchListTile(
                              title: const Text('是否错题'),
                              value: _isMistake,
                              onChanged: (bool v) =>
                                  setState(() => _isMistake = v),
                            ),
                            SwitchListTile(
                              title: const Text('是否收藏'),
                              value: _isFavorite,
                              onChanged: (bool v) =>
                                  setState(() => _isFavorite = v),
                            ),
                          ],
                        ),
                      ),
                      _SectionCard(
                        title: '难度',
                        child: DropdownButtonFormField<String?>(
                          value: _difficulty,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          items: const <DropdownMenuItem<String?>>[
                            DropdownMenuItem<String?>(
                                value: null, child: Text('未设置')),
                            DropdownMenuItem<String?>(
                                value: 'easy', child: Text('简单')),
                            DropdownMenuItem<String?>(
                                value: 'medium', child: Text('中等')),
                            DropdownMenuItem<String?>(
                                value: 'hard', child: Text('困难')),
                          ],
                          onChanged: (String? v) {
                            setState(() => _difficulty = v);
                          },
                        ),
                      ),
                      if (widget.isEdit)
                        _SectionCard(
                          title: '风险等级',
                          child: Text(
                            riskLevelLabel(widget.item!.risk_level),
                          ),
                        ),
                      const SizedBox(height: 16),
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
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
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

/// 表单分区卡片，统一标题与内边距。
class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}
