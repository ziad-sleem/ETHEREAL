import 'dart:io';

// Run this command:
// dart run tools/generate_feature.dart featureName

void main(List<String> args) {
  if (args.isEmpty) {
    print('❌ Please provide a feature name');
    return;
  }

  final featureName = args.first.toLowerCase();
  final basePath = 'lib/features/$featureName';

  // 📁 Create folders
  final structure = [
    '$basePath/api/api_client',
    '$basePath/api/datasources',
    '$basePath/api/models',

    '$basePath/data/datasources',
    '$basePath/data/models',
    '$basePath/data/repositories',
    '$basePath/data/response',

    '$basePath/domain/entities',
    '$basePath/domain/repositories',
    '$basePath/domain/usecases',

    '$basePath/presentation/cubit',
    '$basePath/presentation/pages',
    '$basePath/presentation/widgets',
  ];

  for (var path in structure) {
    Directory(path).createSync(recursive: true);
  }

  // 📄 API layer
  createFile('$basePath/api/api_client/${featureName}_api_client.dart');
  createFile(
    '$basePath/api/datasources/${featureName}_remote_data_source_impl.dart',
  );
  createFile(
    '$basePath/api/datasources/${featureName}_local_data_source_impl.dart',
  );
  createFile('$basePath/api/models/${featureName}_request_body.dart');

  // 📄 Data layer
  createFile(
    '$basePath/data/datasources/${featureName}_remote_data_source_contract.dart',
  );
  createFile(
    '$basePath/data/datasources/${featureName}_local_data_source_contract.dart',
  );
  createFile('$basePath/data/models/${featureName}_model.dart');
  createFile('$basePath/data/repositories/${featureName}_repo_impl.dart');
  createFile('$basePath/data/response/${featureName}_response_model.dart');

  // 📄 Domain layer
  createFile('$basePath/domain/entities/${featureName}_entity.dart');
  createFile('$basePath/domain/repositories/${featureName}_repo.dart');
  createFile('$basePath/domain/usecases/${featureName}_use_case.dart');

  // 📄 Presentation layer (Cubit)
  createFile('$basePath/presentation/cubit/${featureName}_cubit.dart');
  createFile('$basePath/presentation/cubit/${featureName}_state.dart');
  createFile('$basePath/presentation/pages/${featureName}_page.dart');
  createFile('$basePath/presentation/widgets/${featureName}_widget.dart');

  print('✅ Feature \"$featureName\" created successfully!');
}

// 🧩 Create empty file safely
void createFile(String path) {
  final file = File(path);

  if (!file.existsSync()) {
    file.createSync(recursive: true);
  }
}
