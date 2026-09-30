import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/study_items.dart';
import 'tables/subjects.dart';

part 'app_database.g.dart';

/// 数据库文件名（drift_flutter 会自动追加 .sqlite 后缀）。
const String _databaseName = 'kaoyan_review_app';

/// APP 本地数据库。
///
/// 技术：SQLite + Drift
/// 连接：drift_flutter
/// 文件：getApplicationDocumentsDirectory() 下的 kaoyan_review_app.sqlite
@DriftDatabase(tables: [Subjects, StudyItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: _databaseName));

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      // 全新安装：一次性创建当前 schemaVersion 对应的全部表
      // （subjects、study_items）。
      await m.createAll();
    },
    onUpgrade: (Migrator m, int from, int to) async {
      // v1 -> v2：仅新增 study_items 表，保留 subjects 表及其已有数据。
      // 不删除任何已有表，不重建数据库。
      if (from < 2) {
        await m.createTable(studyItems);
      }
    },
  );
}
