// ignore_for_file: avoid_print
import 'dart:io';

import 'extensions.dart';

Future<void> createFeature(String featureName) async {
  final directoryPath = 'lib/features/$featureName';

  if (await Directory(directoryPath).exists()) {
    print('📂 The feature $directoryPath already exists.');
  } else {
    final directories = [
      'lib/features/$featureName/data/repositories',
      'lib/features/$featureName/data/src',
      'lib/features/$featureName/domain/models',
      'lib/features/$featureName/domain/models/request',
      'lib/features/$featureName/domain/models/response',
      'lib/features/$featureName/domain/repositories',
      'lib/features/$featureName/domain/usecases',
      'lib/features/$featureName/presentation/controllers',
      'lib/features/$featureName/presentation/pages',
      'lib/features/$featureName/presentation/widgets',
    ];

    final files = [
      'lib/features/$featureName/data/repositories/${featureName}_repository_impl.dart',
      'lib/features/$featureName/data/src/${featureName}_api_service.dart',
      'lib/features/$featureName/domain/repositories/${featureName}_repository.dart',
    ];

    for (var dir in directories) {
      await Directory(dir).create(recursive: true);
    }

    final readmePaths = [
      'lib/features/$featureName/data/repositories/README.md',
      'lib/features/$featureName/data/src/README.md',
      'lib/features/$featureName/domain/models/README.md',
      'lib/features/$featureName/domain/models/request/README.md',
      'lib/features/$featureName/domain/models/response/README.md',
      'lib/features/$featureName/domain/repositories/README.md',
      'lib/features/$featureName/domain/usecases/README.md',
      'lib/features/$featureName/presentation/controllers/README.md',
      'lib/features/$featureName/presentation/pages/README.md',
      'lib/features/$featureName/presentation/widgets/README.md',
    ];

    final readmeContents = [
      'This folder is for implementation abstract class from domain',
      'This folder is for api service',
      'This folder is to accommodate responses and requests',
      'This folder is for request models',
      'This folder is for response models',
      'This folder is for a abstraction class',
      'This folder is for execute abstraction class function',
      'This folder is for controller of a page',
      'This folder is for pages of the features',
      'This folder is for widgets of the features',
    ];

    for (var i = 0; i < readmePaths.length; i++) {
      await File(readmePaths[i]).writeAsString(readmeContents[i]);
    }

    for (var file in files) {
      await File(file).create(recursive: true);
    }

    _repositoryImplFile(featureName, files[0]);
    _srcApiFile(featureName, files[1]);
    _repositoryFile(featureName, files[2]);
    _bindingFile(featureName);

    print('🗃️  feature created: $featureName');
  }
}

void _repositoryFile(String featureName, String path) {
  final file = File(path);
  final content = '''
import 'package:flutter_clean_architecture/config/bases/base_data_state.dart';

abstract class ${featureName.capitalize()}Repository {}
''';
  file.writeAsStringSync(content);
}

void _repositoryImplFile(String featureName, String path) {
  final file = File(path);
  final content = '''
import 'package:flutter_clean_architecture/config/bases/base_api_repository.dart';
import 'package:flutter_clean_architecture/config/bases/base_data_state.dart';
import 'package:flutter_clean_architecture/features/$featureName/domain/repositories/${featureName}_repository.dart';
import 'package:flutter_clean_architecture/features/$featureName/data/src/${featureName}_api_service.dart';

class ${featureName.capitalize()}RepositoryImpl extends ApiRepository implements ${featureName.capitalize()}Repository {
  final ${featureName.capitalize()}ApiService ${featureName}ApiService;
  ${featureName.capitalize()}RepositoryImpl(this.${featureName}ApiService);
}
''';
  file.writeAsStringSync(content);
}

void _srcApiFile(String featureName, String path) {
  final file = File(path);
  final content = '''
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_clean_architecture/shared/constants/apis.dart';

part '${featureName}_api_service.g.dart';

@RestApi()
abstract class ${featureName.capitalize()}ApiService {
  factory ${featureName.capitalize()}ApiService(Dio dio) = _${featureName.capitalize()}ApiService;
}
''';
  file.writeAsStringSync(content);
}

void _bindingFile(String featureName) {
  const featureBindingsPath = 'lib/app/bindings/feature_bindings.dart';
  const featureBindingDirPath = 'lib/app/bindings/feature_bindings';

  final fileFeatureBindings = File(featureBindingsPath);
  final fileNewFeatureBinding = File(
    '$featureBindingDirPath/${featureName}_bindings.dart',
  );

  final content = '''
import 'package:get/get.dart';
import 'package:flutter_clean_architecture/shared/utils/main_helpers.dart';
import 'package:flutter_clean_architecture/features/$featureName/data/repositories/${featureName}_repository_impl.dart';
import 'package:flutter_clean_architecture/features/$featureName/data/src/${featureName}_api_service.dart';
import 'package:flutter_clean_architecture/features/$featureName/domain/repositories/${featureName}_repository.dart';

class ${featureName.capitalize()}Bindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ${featureName.capitalize()}ApiService(dio),
      fenix: true,
    );
    Get.lazyPut<${featureName.capitalize()}Repository>(
      () => ${featureName.capitalize()}RepositoryImpl(Get.find<${featureName.capitalize()}ApiService>()),
      fenix: true,
    );
  }
}
''';

  fileNewFeatureBinding.writeAsStringSync(content);

  // Baca isi file FeatureBindings
  final fileFeatureBindingsContent = fileFeatureBindings.readAsStringSync();

  // Tambahkan import sebelum `class FeatureBindings`
  String newImport =
      "import 'package:flutter_clean_architecture/app/bindings/feature_bindings/${featureName}_bindings.dart';";
  String classPattern = r'(^\s*class FeatureBindings\s+extends\s+Bindings\s*{)';

  String updatedContent = fileFeatureBindingsContent.replaceFirstMapped(
      RegExp(classPattern, multiLine: true),
      (match) => '$newImport${match.group(0)}');

  // Tambahkan dependencies baru sebelum `}` terakhir
  String pattern = r'\s*}\s*}\s*$';
  String newDependencies = '''

    ${featureName.capitalize()}Bindings().dependencies();''';

  updatedContent = updatedContent.replaceAllMapped(RegExp(pattern), (match) {
    return '$newDependencies${match.group(0)}';
  });

  // Tulis ulang file FeatureBindings dengan konten yang diperbarui
  fileFeatureBindings.writeAsStringSync(updatedContent);
}
