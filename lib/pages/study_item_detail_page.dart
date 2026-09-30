import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../data/category_repository.dart';
import '../data/image_repository.dart';
import '../data/study_item_repository.dart';
import '../database/app_database.dart';
import '../utils/id_generator.dart';
import '../utils/image_processor.dart';
import '../utils/image_storage.dart';
import '../utils/study_item_meta.dart';
import 'study_item_form_page.dart';

/// 学习内容详情页。
///
/// 展示内容区与学习状态；提供编辑与删除（软删除，二次确认）。
/// 本阶段新增图片能力：缩略图网格、原图查看、删除（二次确认）、上移/下移排序、
/// 从相册单张 / 多张导入。
class StudyItemDetailPage extends StatefulWidget {
  const StudyItemDetailPage({
    super.key,
    required this.studyItemRepository,
    required this.categoryRepository,
    required this.imageRepository,
    required this.subject,
    required this.item,
  });

  final StudyItemRepository studyItemRepository;
  final CategoryRepository categoryRepository;
  final ImageRepository imageRepository;
  final Subject subject;
  final StudyItem item;

  @override
  State<StudyItemDetailPage> createState() => _StudyItemDetailPageState();
}

class _StudyItemDetailPageState extends State<StudyItemDetailPage> {
  late StudyItem _item;
  String? _categoryName;
  bool _loadingCategory = true;

  List<ImageRecord> _images = <ImageRecord>[];
  bool _importing = false;

  late final StreamSubscription<List<ImageRecord>> _imageSub;
  final ImageStorage _imageStorage = const ImageStorage();
  late final ImageProcessor _imageProcessor;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _item = widget.item;
    _imageProcessor = ImageProcessor(_imageStorage);
    _imageSub = widget.imageRepository
        .watchByStudyItem(_item.id)
        .listen(_onImagesChanged);
    _loadCategoryName();
  }

  @override
  void dispose() {
    _imageSub.cancel();
    super.dispose();
  }

  void _onImagesChanged(List<ImageRecord> list) {
    if (mounted) {
      setState(() => _images = list);
    }
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
            '将使用软删除（数据保留在数据库中，仅不再显示），此操作可在后续阶段恢复。\n'
            '注意：关联的图片不会自动删除，将在最终删除设计阶段统一处理。'),
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

  Future<void> _pickImages({required bool multiple}) async {
    if (_importing) {
      return;
    }
    List<XFile> files;
    try {
      if (multiple) {
        files = await _picker.pickMultiImage();
      } else {
        final XFile? picked =
            await _picker.pickImage(source: ImageSource.gallery);
        files = picked == null ? <XFile>[] : <XFile>[picked];
      }
    } catch (e) {
      if (mounted) {
        _showError('选择图片失败：$e');
      }
      return;
    }
    if (files.isEmpty) {
      return;
    }

    setState(() => _importing = true);
    try {
      int sortBase = await widget.imageRepository.nextSortOrder(_item.id);
      for (int i = 0; i < files.length; i++) {
        final String id = newId('img');
        final ProcessedImage processed =
            await _imageProcessor.process(files[i], id);
        await widget.imageRepository.create(
          id: id,
          studyItemId: _item.id,
          filePath: processed.originalPath,
          thumbnailPath: processed.thumbnailPath,
          originalWidth: processed.originalWidth,
          originalHeight: processed.originalHeight,
          fileSize: processed.fileSize,
          sortOrder: sortBase + i,
        );
      }
    } catch (e) {
      if (mounted) {
        _showError('导入失败：$e');
      }
    } finally {
      if (mounted) {
        setState(() => _importing = false);
      }
    }
  }

  Future<void> _confirmDeleteImage(ImageRecord image) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('删除图片'),
        content: const Text('确定删除这张图片吗？\n\n'
            '将同时删除原图与缩略图文件（数据库记录一并删除）。'),
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

    try {
      await widget.imageRepository.delete(
        id: image.id,
        filePath: image.file_path,
        thumbnailPath: image.thumbnail_path,
      );
    } catch (e) {
      if (mounted) {
        _showError('删除失败：$e');
      }
    }
  }

  Future<void> _move(int index, int delta) async {
    final int to = index + delta;
    if (to < 0 || to >= _images.length) {
      return;
    }
    final List<String> ids = _images.map((ImageRecord e) => e.id).toList();
    final String moved = ids.removeAt(index);
    ids.insert(to, moved);
    try {
      await widget.imageRepository.reorder(ids);
    } catch (e) {
      if (mounted) {
        _showError('调整顺序失败：$e');
      }
    }
  }

  Future<void> _openViewer(ImageRecord image) async {
    await showDialog<void>(
      context: context,
      builder: (_) => Dialog(
        insetPadding: const EdgeInsets.all(0),
        backgroundColor: Colors.black,
        child: Stack(
          children: <Widget>[
            Center(
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 4.0,
                child: Image.file(
                  File(image.file_path),
                  fit: BoxFit.contain,
                  errorBuilder: (BuildContext c, Object e, StackTrace? s) =>
                      const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(Icons.broken_image, size: 48, color: Colors.white70),
                        SizedBox(height: 8),
                        Text('图片加载失败',
                            style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 12,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                tooltip: '关闭',
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
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

  Widget _buildImageSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                const Text('图片', style: TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(width: 8),
                Text('（${_images.length}）',
                    style: Theme.of(context).textTheme.bodySmall),
                const Spacer(),
                if (_importing)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                else
                  PopupMenuButton<String>(
                    icon: const Icon(Icons.add_a_photo_outlined),
                    tooltip: '添加图片',
                    onSelected: (String value) =>
                        _pickImages(multiple: value == 'multi'),
                    itemBuilder: (BuildContext context) =>
                        const <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        value: 'single',
                        child: Text('从相册选择一张'),
                      ),
                      PopupMenuItem<String>(
                        value: 'multi',
                        child: Text('从相册选择多张'),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 12),
            if (_images.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Text('暂无图片',
                      style: TextStyle(color: Colors.black54)),
                ),
              )
            else
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _images.length,
                itemBuilder: (BuildContext context, int index) =>
                    _buildImageTile(_images[index], index),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageTile(ImageRecord image, int index) {
    final bool canUp = index > 0;
    final bool canDown = index < _images.length - 1;
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: InkWell(
            onTap: () => _openViewer(image),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                File(image.thumbnail_path),
                fit: BoxFit.cover,
                errorBuilder: (BuildContext c, Object e, StackTrace? s) =>
                    const Center(
                  child: Icon(Icons.broken_image, color: Colors.black38),
                ),
              ),
            ),
          ),
        ),
        // 顺序角标
        Positioned(
          top: 4,
          left: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('${index + 1}',
                style: const TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ),
        // 删除按钮
        Positioned(
          top: 4,
          right: 4,
          child: InkWell(
            onTap: () => _confirmDeleteImage(image),
            child: const CircleAvatar(
              radius: 12,
              backgroundColor: Colors.black54,
              child: Icon(Icons.delete_outline,
                  size: 14, color: Colors.white),
            ),
          ),
        ),
        // 上移 / 下移
        if (canUp)
          Positioned(
            bottom: 4,
            left: 4,
            child: InkWell(
              onTap: () => _move(index, -1),
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.black54,
                child: Icon(Icons.arrow_upward, size: 14, color: Colors.white),
              ),
            ),
          ),
        if (canDown)
          Positioned(
            bottom: 4,
            right: 4,
            child: InkWell(
              onTap: () => _move(index, 1),
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: Colors.black54,
                child: Icon(Icons.arrow_downward, size: 14, color: Colors.white),
              ),
            ),
          ),
      ],
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
          _buildImageSection(),
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
