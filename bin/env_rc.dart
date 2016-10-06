import 'dart:io';

import 'package:args/args.dart';
import 'package:path/path.dart';

const String envRc = "env.rc";

main(List<String> args) async {
  Directory tempDir = await Directory.systemTemp.createTemp();

  ArgParser parser = new ArgParser(allowTrailingOptions: true);
  parser.addFlag('help', abbr: 'h', help: 'Usage help', negatable: false);
  parser.addFlag('verbose',
      abbr: 'v', help: 'Display content in stderr', negatable: false);

  ArgResults results = parser.parse(args);
  if (results['help']) {
    stderr.writeln(parser.usage);
    return;
  }
  bool verbose = results['verbose'];

  String content = r"""
export CHROME_BIN=/usr/bin/google-chrome
export DISPLAY=:99.0
sh -e /etc/init.d/xvfb start
sudo apt-get update
sudo apt-get install -y libappindicator1 fonts-liberation
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb
t=0; until (xdpyinfo -display :99 &> /dev/null || test $t -gt 10); do sleep 1; let t=$t+1; done
""";
  if (verbose) {
    stderr.writeln(content);
  }

  File dst = new File(join(tempDir.path, envRc));
  await dst.writeAsString(content);
  stdout.write(dst.path);
}
