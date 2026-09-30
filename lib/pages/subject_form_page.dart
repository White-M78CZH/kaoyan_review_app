import 'package:flutter/material.dart';

import '../data/subject_repository.dart';
import '../database/app_database.dart';

/// 科目新增 / 编辑表单页。
///
/// 新增时只输入 name / description / sort_order；
/// id、created_at、updated_at 由数据访问层生成。
/// 编辑时不修改 id 与 created_at。
class SubjectFormPage extends StatefulWidget {
  const SubjectFormPage({
    super.key,
    required this.subjectRepository,
    this.subject,
  });

  final SubjectRepository subjectRepository;

  /// 为空表示新增科目。
  final Subject? subject;

  bool get isEdit => subject != null;

  @override
  State<SubjectFormPage> createState() => _SubjectFormPageState();
}

class _SubjectFormPageState extends State<SubjectFormPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _sortOrderController;

  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    final Subject? subject = widget.subject;
    _nameController = TextEditingController(text: subject?.name ?? '');
    _descriptionController = TextEditingController(
      text: subject?.description ?? '',
    );
    _sortOrderController = TextEditingController(
      text: subject == null ? '0' : subject.sort_order.toString(),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _sortOrderController.dispose();
    super.dispose();
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
        (widget.subject?.sort_order ?? 0);

    try {
      if (widget.isEdit) {
        await widget.subjectRepository.update(
          id: widget.subject!.id,
          name: name,
          description: descriptionText.isEmpty ? null : descriptionText,
          sortOrder: sortOrder,
        );
      } else {
        await widget.subjectRepository.create(
          name: name,
          description: descriptionText.isEmpty ? null : descriptionText,
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
      appBar: AppBar(
        title: Text(widget.isEdit ? '编辑科目' : '新增科目'),
      ),
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
                    labelText: '科目名称',
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return '请输入科目名称';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: '科目描述（可选）',
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
