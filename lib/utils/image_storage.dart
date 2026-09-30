import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// App 私有图片目录与路径管理。
///
/// 所有图片文件（原图 / 缩略图）统一存放在 App 私有目录下，
/// 不依赖系统相册原始文件长期存在。数据库只保存这里生成的私有路径。
///
/// 路径集中在此处理，禁止在页面中拼接图片路径。
class ImageStorage {
  const ImageStorage();

  /// 图片根目录：应用私有 documents 目录下的 images 子目录。
  ///
  /// 该目录位于 App 沙盒内，卸载 App 时一并清除，不污染相册。
  Future<Directory> getRootDir() async {
    final Directory docs = await getApplicationDocumentsDirectory();
    final Directory dir = Directory(p.join(docs.path, 'images'));
    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }
    return dir;
  }

  /// 生成原图完整路径。
  ///
  /// [imageId] 与 images 表主键一致，[ext] 为不含点的扩展名（如 jpg / png）。
  Future<String> originalPath(String imageId, String ext) async {
    final Directory dir = await getRootDir();
    return p.join(dir.path, 'orig_$imageId.$ext');
  }

  /// 生成缩略图完整路径，固定为 jpg。
  Future<String> thumbnailPath(String imageId) async {
    final Directory dir = await getRootDir();
    return p.join(dir.path, 'thumb_$imageId.jpg');
  }

  /// 安全删除文件：文件不存在或删除失败都不抛异常。
  ///
  /// 数据库删除不依赖文件是否存在，因此文件层错误必须被吞掉，
  /// 避免导致调用方（页面）崩溃。
  Future<void> deleteFileIfExists(String? path) async {
    if (path == null || path.isEmpty) {
      return;
    }
    try {
      final File file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
    } on FileSystemException catch (_) {
      // 文件已不存在或权限不足：忽略，数据库记录仍应被删除。
    } catch (_) {
      // 其他意外错误同样忽略，保证删除流程不被中断。
    }
  }
}
