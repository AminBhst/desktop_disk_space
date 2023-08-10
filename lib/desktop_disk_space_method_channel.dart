import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'desktop_disk_space_platform_interface.dart';

/// An implementation of [DesktopDiskSpacePlatform] that uses method channels.
class MethodChannelDesktopDiskSpace extends DesktopDiskSpacePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('desktop_disk_space');

  @override
  Future<String?> getFreeSpace(String drive) async {
    final version = await methodChannel.invokeMethod('getFreeSpace', {'drive' : drive});
    return version;
  }



}
