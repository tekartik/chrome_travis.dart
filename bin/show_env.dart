import 'dart:convert';
import 'dart:io';

import 'package:process_run/shell.dart';

Future main() async {
  final info = <String, dynamic>{
    'dart': dartExecutable,
    'dartVersion': dartVersion.toString(),
  };
  info['Platform.operatingSystem'] = Platform.operatingSystem;
  info['Directory.current'] = Directory.current.path;
  info['vars'] = Map.of(ShellEnvironment().vars);
  info['paths'] = List.of(ShellEnvironment().paths);
  info['aliases'] = Map.of(ShellEnvironment().aliases);
  print(const JsonEncoder.withIndent('  ').convert(info));
}
