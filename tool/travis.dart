import 'package:process_run/shell.dart';

Future<void> main() async {
  final shell = Shell();

  await shell.run('''
# Analyze code
dartanalyzer --fatal-warnings --fatal-infos .
dartfmt -n --set-exit-if-changed .

# for debugging
pub run chrome_travis:show_env

# Test on purpose separately to see which platform fails
pub run test -p vm -r expanded
pub run test -p firefox -r expanded
pub run test -p chrome -r expanded

''');
}
