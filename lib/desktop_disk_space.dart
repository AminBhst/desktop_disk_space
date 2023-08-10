import 'package:flutter/services.dart';

class DesktopDiskSpace {
  final MethodChannel _channel = const MethodChannel('desktop_disk_space');

  DesktopDiskSpace._();

  static final DesktopDiskSpace instance = DesktopDiskSpace._();

  Future<int?> getFreeSpace([String drive = "."]) async {
    final space = await _channel.invokeMethod('getFreeSpace', {'drive': drive});
    return int.parse(space);
  }

  Future<int?> getTotalSpace([String drive = "."]) async {
    final space =
        await _channel.invokeMethod('getTotalSpace', {'drive': drive});
    return int.parse(space);
  }
}
