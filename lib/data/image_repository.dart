import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../utils/id_generator.dart';
import '../utils/image_storage.dart';

/// images 表的轻量数据访问层。
///
/// 负责图片记录的查询、新增、删除与排序调整；不含业务逻辑与状态管理。
/// 删除图片时同时清理 App 私有目录中的原图与缩略图文件，且文件缺失不阻断
/// 数据库记录删除。
class ImageRepository {
  const ImageRepository(this._db, this._storage);

  final AppDatabase _db;
  final ImageStorage _storage;

  /// 按 study_item_id 查询图片列表，按 sort_order 升序。
  Future<List<ImageRecord>> getByStudyItem(String studyItemId) {
    return (_db.select(_db.images)
          ..where((t) => t.study_item_id.equals(studyItemId))
          ..orderBy([(t) => OrderingTerm.asc(t.sort_order)]))
        .get();
  }

  /// 监听某个学习内容的图片列表（按 sort_order 升序），实时刷新。
  Stream<List<ImageRecord>> watchByStudyItem(String studyItemId) {
    return (_db.select(_db.images)
          ..where((t) => t.study_item_id.equals(studyItemId))
          ..orderBy([(t) => OrderingTerm.asc(t.sort_order)]))
        .watch();
  }

  /// 返回该学习内容下一张新图片应使用的 sort_order（当前最大值 + 1）。
  Future<int> nextSortOrder(String studyItemId) async {
    final List<ImageRecord> list = await getByStudyItem(studyItemId);
    return list.isEmpty ? 0 : list.last.sort_order + 1;
  }

  /// 新增图片记录。
  ///
  /// 从已处理好的本地图片信息创建；[id] 由调用方生成并与私有文件路径保持一致，
  /// 自动生成 created_at。
  /// [sortOrder] 由调用方按顺序传入（单图取 nextSortOrder，多图依次递增）。
  Future<void> create({
    required String id,
    required String studyItemId,
    required String filePath,
    required String thumbnailPath,
    required int originalWidth,
    required int originalHeight,
    required int fileSize,
    required int sortOrder,
  }) async {
    await _db.into(_db.images).insert(
          ImagesCompanion.insert(
            id: id,
            study_item_id: studyItemId,
            file_path: filePath,
            thumbnail_path: thumbnailPath,
            original_width: originalWidth,
            original_height: originalHeight,
            file_size: fileSize,
            sort_order: sortOrder,
            created_at: nowMillis(),
          ),
        );
  }

  /// 删除图片记录并清理对应文件。
  ///
  /// 先删除数据库记录（核心），再尽力删除原图与缩略图；
  /// 文件不存在或删除失败均被安全忽略，不抛出异常、不影响记录删除结果。
  Future<void> delete({
    required String id,
    required String filePath,
    required String thumbnailPath,
  }) async {
    await (_db.delete(_db.images)..where((t) => t.id.equals(id))).go();
    await _storage.deleteFileIfExists(filePath);
    await _storage.deleteFileIfExists(thumbnailPath);
  }

  /// 更新单张图片的 sort_order。
  Future<void> updateSortOrder(String id, int sortOrder) async {
    await (_db.update(_db.images)..where((t) => t.id.equals(id))).write(
          ImagesCompanion(sort_order: Value<int>(sortOrder)),
        );
  }

  /// 批量重排：按传入的 id 顺序重新分配 sort_order（0,1,2,...）。
  ///
  /// 使用事务批量写入，保证顺序一致。本阶段用于「上移 / 下移」等简单排序。
  Future<void> reorder(List<String> orderedIds) async {
    await _db.batch((Batch batch) {
      for (int i = 0; i < orderedIds.length; i++) {
        batch.update(
          _db.images,
          ImagesCompanion(sort_order: Value<int>(i)),
          where: (t) => t.id.equals(orderedIds[i]),
        );
      }
    });
  }
}
