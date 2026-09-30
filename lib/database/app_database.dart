import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'tables/subjects.dart';

part 'app_database.g.dart';

/// 数据库文件名（drift_flutter 会自动追加 .sqlite 后缀）。
const String _databaseName = 'kaoyan_review_app';

/// APP 本地数据库。
///
/// 技术：SQLite + Drift
/// 连接：drift_flutter
/// 文件：getApplicationDocumentsDirectory() 下的 kaoyan_review_app.sqlite
@DriftDatabase(tables: [Subjects])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: _databaseName));

  @override
  int get schemaVersion => 1;
}
