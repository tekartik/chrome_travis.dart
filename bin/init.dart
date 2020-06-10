// Since dart 2.9, executables are no longer precompile, force it here
// by running the command once
import 'package:process_run/shell_run.dart';

Future main() async {
  await run('pub run chrome_travis:env_rc -h', verbose: false);
}
