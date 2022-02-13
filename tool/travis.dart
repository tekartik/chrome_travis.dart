import 'package:process_run/shell.dart';

Future<void> main() async {
  final shell = Shell();

  await shell.run('''
# Analyze code
dartanalyzer --fatal-warnings --fatal-infos .
dartfmt -n --set-exit-if-changed .

# for debugging
dart pub run chrome_travis:show_env

# Test on purpose separately to see which platform fails
dart pub run test -p vm -r expanded
dart pub run test -p firefox -r expanded
dart pub run test -p chrome -r expanded

''');
}
