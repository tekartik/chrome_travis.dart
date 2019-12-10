import 'dart:convert';
import 'dart:io';

import 'package:process_run/cmd_run.dart';

Future main() async {
  await run('which', ['dart'], verbose: true);
  await run('which', ['pub'], verbose: true);
  await run('which', ['dart2js'], verbose: true);
  await run('which', ['google-chrome'], verbose: true);
  await run('which', ['firefox'], verbose: true);
  final info = {};
  info['Platform.operatingSystem'] = Platform.operatingSystem;
  info['Directory.current'] = Directory.current.path;
  info['Platform.environment'] = Platform.environment;
  print(const JsonEncoder.withIndent('  ').convert(info));
}
