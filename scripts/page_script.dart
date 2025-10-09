// ignore_for_file: avoid_print
import 'dart:io';

import 'extensions.dart';

Future<void> createPage(
  String pageName,
  String featurePage,
  bool isPagging,
) async {
  final featurePath = 'lib/features/$featurePage';

  final featureDir = Directory(featurePath);
  if (!featureDir.existsSync()) {
    print('📂 ERROR: Feature "$featurePage" does not exist');
    return;
  }

  final pageFile = File('$featurePath/presentation/pages/$pageName.page.dart');
  final controllerFile = File(
    '$featurePath/presentation/controllers/$pageName.controller.dart',
  );

  if (pageFile.existsSync()) {
    print('📄 The $pageName.page already exists');
    return;
  } else {
    await pageFile.create(recursive: true);
  }

  if (controllerFile.existsSync()) {
    print('📄 The $pageName.controller already exists');
    return;
  } else {
    await controllerFile.create(recursive: true);
  }

  late String pageContent, controllerContent;

  if (!isPagging) {
    pageContent =
        '''
import 'package:flutter/material.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/$featurePage/presentation/controllers/$pageName.controller.dart';
import 'package:get/get.dart';

class ${pageName.toPascalCase()}Page extends GetView<${pageName.toPascalCase()}Controller> {
  const ${pageName.toPascalCase()}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$pageName'),
      ),
      body: const Center(
        child: Text(
          '$pageName',
        )
      ),
    );
  }
}
''';

    controllerContent =
        '''
import 'package:aldi_m_alpaujan_mobile_front_end/shared/utils/handler_api_mixin.dart';
import 'package:get/get.dart';

class ${pageName.toPascalCase()}Controller extends GetxController with HandlerApiMixin {}
''';
  } else {
    pageContent =
        '''
import 'package:flutter/material.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/common/presentation/views/app_data_list_view.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/$featurePage/presentation/controllers/$pageName.controller.dart';
import 'package:get/get.dart';

class ${pageName.toPascalCase()}Page extends GetView<${pageName.toPascalCase()}Controller> {
  const ${pageName.toPascalCase()}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('$pageName'),
      ),
      body: AppDataListView(
        noData: controller.noData,
        isError: controller.isError,
        isLoading: controller.isLoading,
        emptyData: controller.data.isEmpty,
        refreshData: () => controller.refreshData(),
        loadData: () => controller.loadData(),
        children: const [],
      ),
    );
  }
}
''';

    controllerContent =
        '''
import 'package:aldi_m_alpaujan_mobile_front_end/config/bases/base_api_pagination.dart';

class ${pageName.toPascalCase()}Controller extends ApiPagination {

  @override
  Future<void> getData({bool isLoad = false, String? keyword}) async {
    // await runRequest(
    //   usecase,
    //   isLoad,
    //   keyword,
    // );
  }

  @override
  Future<void> loadData() async {
    await getData();
  }

  @override
  Future<void> refreshData() {
    return getData(isLoad: true);
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
''';
  }

  await controllerFile.writeAsString(controllerContent);
  await pageFile.writeAsString(pageContent);

  print('📄 $pageName created');
  _addRouteAndPage(featurePage, pageName);
}

void _addRouteAndPage(String featurePage, String pageName) {
  const routerPath = 'lib/app/routes/routes.dart';
  const pagesPath = 'lib/app/routes/pages.dart';
  final routerFile = File(routerPath);
  final pagesFile = File(pagesPath);

  if (!routerFile.existsSync() || !pagesFile.existsSync()) {
    print('🚨 ERROR: One or both files do not exist.');
    return;
  }

  // Read and update router.dart
  final routerContent = routerFile.readAsStringSync();
  final updatedRoutesContent = routerContent.replaceFirst(
    RegExp(r'}\s*$'), // Cari tanda "}" terakhir di file
    "  static const String $pageName = '/$pageName';\n}", // Tambahkan route baru
  );
  routerFile.writeAsStringSync(updatedRoutesContent);

  // Prepare new import statement
  final pageImport =
      '''
import 'package:aldi_m_alpaujan_mobile_front_end/features/$featurePage/presentation/pages/$pageName.page.dart';
import 'package:aldi_m_alpaujan_mobile_front_end/features/$featurePage/presentation/controllers/$pageName.controller.dart';
''';

  // Read current pages.dart content
  final pagesContent = pagesFile.readAsStringSync();

  // Tambahkan import baru di atas "part 'routes.dart';"
  final updatedPagesContentWithImport = pagesContent.replaceFirst(
    RegExp(r"(\npart\s+\'routes\.dart\';)"),
    "$pageImport\npart 'routes.dart';", // Tambahkan import sebelum part statement
  );

  // Prepare new GetPage
  final newGetPage =
      '''
  GetPage(
      name: Routes.$pageName,
      page: () => const ${pageName.toPascalCase()}Page(),
      binding: BindingsBuilder(
        () => Get.lazyPut(() => ${pageName.toPascalCase()}Controller()),
      ),
    ),''';

  // Tambahkan GetPage baru sebelum "];" di dalam list pages
  final updatedPagesContentFinal = updatedPagesContentWithImport
      .replaceFirstMapped(
        RegExp(r'(\];\s*\})'), // Cari tanda "];" diikuti penutup kelas "}"
        (match) => '$newGetPage\n  ];\n}', // Tambahkan GetPage
      );

  // Tulis ulang file pages.dart
  pagesFile.writeAsStringSync(updatedPagesContentFinal);

  print('✅ Route and page added successfully.');
}
