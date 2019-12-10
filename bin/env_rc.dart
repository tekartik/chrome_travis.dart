import 'dart:io';

import 'package:args/args.dart';
import 'package:path/path.dart';

const String envRc = 'env.rc';

Future main(List<String> args) async {
  final tempDir = await Directory.systemTemp.createTemp();

  final parser = ArgParser(allowTrailingOptions: true);
  parser.addFlag('help', abbr: 'h', help: 'Usage help', negatable: false);
  parser.addFlag('verbose',
      abbr: 'v', help: 'Display content in stderr', negatable: false);

  final results = parser.parse(args);
  if (results['help'] as bool) {
    stderr.writeln(parser.usage);
    return;
  }
  final verbose = results['verbose'] as bool;

  final content = r'''
export CHROME_BIN=/usr/bin/google-chrome
export DISPLAY=:99.0
sh -e /etc/init.d/xvfb start
sudo apt-get update
sudo apt-get install -y libappindicator1 fonts-liberation
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
t=0; until (xdpyinfo -display :99 &> /dev/null || test $t -gt 10); do sleep 1; let t=$t+1; done
''';
  if (verbose) {
    stderr.writeln(content);
  }

  final dst = File(join(tempDir.path, envRc));
  await dst.writeAsString(content);
  stdout.write(dst.path);
}
