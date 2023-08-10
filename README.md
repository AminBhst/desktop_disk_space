[![Pub](https://img.shields.io/pub/v/desktop_disk_space.svg?style=popout&include_prereleases)](https://pub.dev/packages/desktop_disk_space)
[![license](https://img.shields.io/github/license/aminbhst/desktop_disk_space)](https://github.com/AminBhst/flutter_music_player/blob/main/LICENSE)

# desktop_disk_space

A Flutter plugin to query the disk space on desktop

## Installing

With Flutter:
```shell
$ flutter pub add desktop_disk_space
```
This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):

```yaml
dependencies:
desktop_disk_space: ^0.0.1
```

## Note
* This plugin is under development and currently only supports windows.
* Support for Linux will be added in the future.
* Pull requests are welcome (especially for MacOS support)

## Usage
```dart
void test() async {
  final currentDriveTotalSpace = await DesktopDiskSpace.instance.getTotalSpace();
  final currentDriveFreeSpace = await DesktopDiskSpace.instance.getFreeSpace();
  final c_driveTotalSpace = await DesktopDiskSpace.instance.getTotalSpace("C:\\");
  final c_driveFreeSpace = await DesktopDiskSpace.instance.getFreeSpace("C:\\"); 
}
```
