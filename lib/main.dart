import 'package:flutter/material.dart';

import 'data/category_repository.dart';
import 'data/image_repository.dart';
import 'data/study_item_repository.dart';
import 'data/subject_repository.dart';
import 'database/app_database.dart';
import 'pages/subject_list_page.dart';
import 'utils/image_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 本地 SQLite 数据库，离线使用，不依赖网络与账号。
  final AppDatabase database = AppDatabase();

  runApp(
    KaoyanReviewApp(
      subjectRepository: SubjectRepository(database),
      categoryRepository: CategoryRepository(database),
      studyItemRepository: StudyItemRepository(database),
      imageRepository: ImageRepository(database, const ImageStorage()),
    ),
  );
}

/// APP 根组件。
///
/// 当前阶段入口为「科目管理」，从科目进入分类树管理，再进入学习内容管理。
class KaoyanReviewApp extends StatelessWidget {
  const KaoyanReviewApp({
    super.key,
    required this.subjectRepository,
    required this.categoryRepository,
    required this.studyItemRepository,
    required this.imageRepository,
  });

  final SubjectRepository subjectRepository;
  final CategoryRepository categoryRepository;
  final StudyItemRepository studyItemRepository;
  final ImageRepository imageRepository;

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
        studyItemRepository: studyItemRepository,
        imageRepository: imageRepository,
      ),
    );
  }
}
