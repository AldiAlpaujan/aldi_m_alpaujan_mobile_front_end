import 'feature_script.dart';
import 'page_script.dart';
import 'usecase_scipts.dart';

void main(List<String> args) {
  final slug = args[0].split(':')[0];

  if (slug == 'feature') {
    createFeature(args[0].split(':')[1]);
  }
  if (slug == 'page') {
    // TODO: fix if name has space / '_'
    createPage(
      args[0].split(':')[1].toLowerCase(),
      args[1].split(':')[1].toLowerCase(),
      args.contains('--with-paging'),
    );
  }
  if (slug == 'usecase') {
    createUseCase(
      args[0].split(':')[1].toLowerCase(),
      args[1].split(':')[1].toLowerCase(),
      UseCaseType.fromString(args[2].split(':')[1].toLowerCase()),
    );
  }
}
