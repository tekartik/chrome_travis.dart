import 'dart:io';
import 'package:path/path.dart';

const String envRc = "env.rc";

main() async {
  Directory tempDir = await Directory.systemTemp.createTemp();

  File src = new File(join(dirname(Platform.script.toFilePath()), envRc));
  File dst = new File(join(tempDir.path, envRc));
  await dst.writeAsString(await src.readAsString());
  stdout.write(dst.path);
}

