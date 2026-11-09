# chrome_travis.dart

**Legacy.** Travis CI helper scripts to run Dart unit tests on Chrome (and
Firefox) on the old Travis Ubuntu images (trusty, xvfb). Not needed on GitHub
Actions: its Ubuntu, macOS and Windows runners have Chrome, `dart test -p
chrome` works as is (see [tekartik/ci.dart](https://github.com/tekartik/ci.dart)
for the workflows). Kept for the old repositories still using it; not on
pub.dev.

## What it does

`dart run chrome_travis:env_rc` writes a shell script (in `$TRAVIS_TMPDIR`,
or the system temp folder) and prints its path. Sourcing it exports
`CHROME_BIN`, `DISPLAY` and `MOZ_HEADLESS=1`, starts xvfb and installs the
latest Chrome with `apt-get` and `dpkg` (it needs `sudo`). `-v` also prints
the script on stderr.

`dart run chrome_travis:show_env` prints the dart executable, version and the
`process_run` environment as json, for debugging.

## Setup (Travis)

[Note about versioning.](https://github.com/tekartik/common.dart/blob/main/doc/tekartik_versioning.md)

```yaml
dev_dependencies:
  test: any
  chrome_travis:
    git:
      url: https://github.com/tekartik/chrome_travis.dart
      ref: dart2_3
```

`.travis.yml`:

```yaml
language: dart
sudo: required
dist: trusty
dart:
  - stable
before_script:
  - source $(dart run chrome_travis:env_rc)
script:
  - dart test -p vm -p chrome
```

This repository runs its own tests on GitHub Actions (`tool/run_ci.dart`);
`.travis.yml` and `tool/travis.dart` are the old Travis setup.
