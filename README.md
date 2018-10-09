# chrome_travis.dart

Travis helper scripts to allow running unit test on Chrome

## Setup

This assumes you are familiar with Dart and Travis integration

Include `chrome_travis.dart` as a development dependencies in your `pubspec.yaml` file

```yaml
dev_dependencies:
  test: any
  chrome_travis:
    git: 
      url: git://github.com/tekartik/chrome_travis.dart
      ref: dart2
```

Create the following `.travis.yml` file

```yaml
language: dart
sudo: required
dist: trusty
dart:
  - stable
  - dev
before_script:
 - source $(pub run chrome_travis:env_rc)
script:
 - pub run test -p vm -p chrome
```

Configure your project to run in https://travis-ci.org

## Example

This project use the solution itself