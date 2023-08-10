import 'package:flutter/services.dart';

class DesktopDiskSpace {
  final MethodChannel _channel = const MethodChannel('desktop_disk_space');

  DesktopDiskSpace._();

  static final DesktopDiskSpace instance = DesktopDiskSpace._();

  /// Gets the free space of the specified [drive].
  /// If no arguments are provided, the current drive will be queried
  Future<int?> getFreeSpace([String drive = "."]) async {
    final space = await _channel.invokeMethod('getFreeSpace', {'drive': drive});
    return int.parse(space);
  }

  /// Gets the total space of the specified [drive].
  /// If no arguments are provided, the current drive will be queried
  Future<int?> getTotalSpace([String drive = "."]) async {
    final space =
        await _channel.invokeMethod('getTotalSpace', {'drive': drive});
    return int.parse(space);
  }
}
