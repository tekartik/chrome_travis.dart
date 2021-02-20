import 'dart:convert';
import 'dart:io';

import 'package:process_run/shell.dart';

Future main() async {
  await run('which dart');
  await run('which pub');
  await run('which dart2js');
  await run('which google-chrome');
  await run('which firefox');
  final info = {};
  info['Platform.operatingSystem'] = Platform.operatingSystem;
  info['Directory.current'] = Directory.current.path;
  info['Platform.environment'] = Platform.environment;
  info['vars'] = Map.from(ShellEnvironment().vars);
  info['paths'] = List.from(ShellEnvironment().paths);
  info['aliases'] = Map.from(ShellEnvironment().aliases);
  print(const JsonEncoder.withIndent('  ').convert(info));
}
