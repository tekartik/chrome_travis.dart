import 'package:process_run/shell.dart';

Future<void> main() async {
  final shell = Shell();

  await shell.run('''
# Analyze code
dart analyze --fatal-warnings --fatal-infos .
dart format --output=none --set-exit-if-changed .

# for debugging
dart run chrome_travis:show_env

# Test on purpose separately to see which platform fails
dart test -p vm -r expanded
dart test -p firefox -r expanded
dart test -p chrome -r expanded

''');
}
