import 'package:flutter/material.dart';

import 'data/category_repository.dart';
import 'data/subject_repository.dart';
import 'database/app_database.dart';
import 'pages/subject_list_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 本地 SQLite 数据库，离线使用，不依赖网络与账号。
  final AppDatabase database = AppDatabase();

  runApp(
    KaoyanReviewApp(
      subjectRepository: SubjectRepository(database),
      categoryRepository: CategoryRepository(database),
    ),
  );
}

/// APP 根组件。
///
/// 当前阶段入口为「科目管理」，从科目进入分类树管理。
class KaoyanReviewApp extends StatelessWidget {
  const KaoyanReviewApp({
    super.key,
    required this.subjectRepository,
    required this.categoryRepository,
  });

  final SubjectRepository subjectRepository;
  final CategoryRepository categoryRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '考研复习助手',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: SubjectListPage(
        subjectRepository: subjectRepository,
        categoryRepository: categoryRepository,
      ),
    );
  }
}
