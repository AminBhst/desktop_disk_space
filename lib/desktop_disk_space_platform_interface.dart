import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'desktop_disk_space_method_channel.dart';

abstract class DesktopDiskSpacePlatform extends PlatformInterface {
  /// Constructs a DesktopDiskSpacePlatform.
  DesktopDiskSpacePlatform() : super(token: _token);

  static final Object _token = Object();

  static DesktopDiskSpacePlatform _instance = MethodChannelDesktopDiskSpace();

  /// The default instance of [DesktopDiskSpacePlatform] to use.
  ///
  /// Defaults to [MethodChannelDesktopDiskSpace].
  static DesktopDiskSpacePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DesktopDiskSpacePlatform] when
  /// they register themselves.
  static set instance(DesktopDiskSpacePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getFreeSpace(String drive) async {
    const MethodChannel _channel = MethodChannel('desktop_disk_space');
    final version = await _channel.invokeMethod('getFreeSpace', {'drive' : drive});
    return version;
  }
}
