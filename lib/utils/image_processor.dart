import 'dart:io';
import 'dart:typed_data';

import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

import 'image_storage.dart';

/// 单张图片处理结果（已写入 App 私有目录）。
class ProcessedImage {
  const ProcessedImage({
    required this.imageId,
    required this.originalPath,
    required this.thumbnailPath,
    required this.originalWidth,
    required this.originalHeight,
    required this.fileSize,
    required this.ext,
  });

  final String imageId;
  final String originalPath;
  final String thumbnailPath;
  final int originalWidth;
  final int originalHeight;
  final int fileSize;
  final String ext;
}

/// 图片导入后的处理：复制到 App 私有目录、必要压缩、生成缩略图、读取尺寸。
///
/// 设计原则：
/// - 不依赖系统相册原文件，导入后立即复制到 App 私有目录。
/// - 不过度压缩：仅当图片明显过大（长边超限或体积过大）才重新编码压缩，
///   小图尽量保持原始字节，保证题目文字清晰可读。
/// - 缩略图固定较小尺寸、保持比例，用于列表显示，与原图分离存储。
/// - 对无法解码的格式（如部分 HEIC）做兼容：保留原始字节、缩略图回退为原图。
class ImageProcessor {
  const ImageProcessor(this._storage);

  final ImageStorage _storage;

  /// 处理一张来自相册的图片（image_picker 的 XFile）。
  ///
  /// [sourceId] 由调用方生成（与 images 表主键一致），用于文件命名。
  Future<ProcessedImage> process(XFile source, String sourceId) async {
    final Uint8List bytes = await source.readAsBytes();

    const int maxAllowed = 2000; // 原图压缩上限：长边像素
    const int sizeThreshold = 1500 * 1024; // 1.5MB：超过则重新编码压缩

    final img.Image? decoded = img.decodeImage(bytes);

    String ext;
    Uint8List originalBytes;
    int originalWidth;
    int originalHeight;

    if (decoded == null) {
      // 无法解码（格式不支持）：保留原文件字节，尺寸记为未知。
      ext = _extFromPath(source.path);
      originalBytes = bytes;
      originalWidth = 0;
      originalHeight = 0;
    } else {
      originalWidth = decoded.width;
      originalHeight = decoded.height;
      final int longest =
          originalWidth >= originalHeight ? originalWidth : originalHeight;
      final bool tooLarge = longest > maxAllowed || bytes.length > sizeThreshold;

      if (!tooLarge) {
        // 小图：直接保留原始字节，不重新编码，最大限度保持清晰度。
        ext = _extFromPath(source.path);
        originalBytes = bytes;
      } else {
        // 大图：等比缩放到长边 maxAllowed，重新编码为 JPEG（质量 85）。
        final img.Image resized = _resizeLongest(decoded, maxAllowed);
        ext = 'jpg';
        originalBytes = Uint8List.fromList(img.encodeJpg(resized, quality: 85));
      }
    }

    final String originalPath =
        await _storage.originalPath(sourceId, ext.isEmpty ? 'jpg' : ext);
    await File(originalPath).writeAsBytes(originalBytes);

    String thumbnailPath = await _storage.thumbnailPath(sourceId);
    if (decoded != null) {
      final img.Image thumb = _resizeLongest(decoded, 400);
      await File(thumbnailPath)
          .writeAsBytes(Uint8List.fromList(img.encodeJpg(thumb, quality: 80)));
    } else {
      // 无法解码时缩略图回退为原图，避免空路径。
      thumbnailPath = originalPath;
    }

    return ProcessedImage(
      imageId: sourceId,
      originalPath: originalPath,
      thumbnailPath: thumbnailPath,
      originalWidth: originalWidth,
      originalHeight: originalHeight,
      fileSize: await File(originalPath).length(),
      ext: ext.isEmpty ? 'jpg' : ext,
    );
  }

  /// 等比缩放，使最长边不超过 [max]（保持比例）。
  img.Image _resizeLongest(img.Image image, int max) {
    final int w = image.width;
    final int h = image.height;
    if (w >= h && w > max) {
      return img.copyResize(image, width: max);
    } else if (h > max) {
      return img.copyResize(image, height: max);
    }
    return image;
  }

  String _extFromPath(String path) {
    final String e = p.extension(path).toLowerCase().replaceAll('.', '');
    // 仅允许常见图片扩展名；未知时回退为 jpg（重新编码场景使用）。
    const Set<String> allowed = <String>{
      'jpg',
      'jpeg',
      'png',
      'webp',
      'gif',
      'bmp',
    };
    return allowed.contains(e) ? e : 'jpg';
  }
}
