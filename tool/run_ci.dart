import 'package:dev_build/package.dart';
import 'package:process_run/shell.dart';

Future<void> main() async {
  final shell = Shell();

  await shell.run('''
# for info
dart pub run chrome_travis:show_env
''');
  await packageRunCi('.');
}
