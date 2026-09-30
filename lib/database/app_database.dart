import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/categories.dart';
import 'tables/fsrs_cards.dart';
import 'tables/images.dart';
import 'tables/review_records.dart';
import 'tables/study_item_tags.dart';
import 'tables/study_items.dart';
import 'tables/subjects.dart';
import 'tables/tags.dart';

part 'app_database.g.dart';

/// 数据库文件名（drift_flutter 会自动追加 .sqlite 后缀）。
const String _databaseName = 'kaoyan_review_app';

/// APP 本地数据库。
///
/// 技术：SQLite + Drift
/// 连接：drift_flutter
/// 文件：getApplicationDocumentsDirectory() 下的 kaoyan_review_app.sqlite
@DriftDatabase(
  tables: [
    Subjects,
    StudyItems,
    Categories,
    Images,
    Tags,
    StudyItemTags,
    FsrsCards,
    ReviewRecords,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: _databaseName));

  @override
  int get schemaVersion => 8;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      // 全新安装：一次性创建当前 schemaVersion 对应的全部表
      // （subjects、study_items、categories、images、tags、study_item_tags、
      // fsrs_cards、review_records）。
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // v1 -> v2：仅新增 study_items 表，保留 subjects 及其已有数据。
      if (from < 2) {
        await m.createTable(studyItems);
      }
      // v2 -> v3：仅新增 categories 表，保留 subjects、study_items
      // 及其已有数据。不删除任何已有表，不重建数据库。
      if (from < 3) {
        await m.createTable(categories);
      }
      // v3 -> v4：仅新增 images 表，保留 subjects、study_items、categories
      // 及其已有数据。不删除任何已有表，不重建数据库。
      if (from < 4) {
        await m.createTable(images);
      }
      // v4 -> v5：仅新增 tags 表，保留 subjects、study_items、categories、images
      // 及其已有数据。不删除任何已有表，不重建数据库。
      if (from < 5) {
        await m.createTable(tags);
      }
      // v5 -> v6：仅新增 study_item_tags 表，保留 subjects、study_items、
      // categories、images、tags 及其已有数据。不删除任何已有表，不重建数据库。
      if (from < 6) {
        await m.createTable(studyItemTags);
      }
      // v6 -> v7：仅新增 fsrs_cards 表，保留 subjects、study_items、categories、
      // images、tags、study_item_tags 及其已有数据。
      // 不删除任何已有表，不重建数据库。
      if (from < 7) {
        await m.createTable(fsrsCards);
      }
      // v7 -> v8：仅新增 review_records 表，保留 subjects、study_items、
      // categories、images、tags、study_item_tags、fsrs_cards 及其已有数据。
      // 不删除任何已有表，不重建数据库。
      if (from < 8) {
        await m.createTable(reviewRecords);
      }
    },
  );
}
