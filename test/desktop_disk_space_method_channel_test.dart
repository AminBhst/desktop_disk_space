import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desktop_disk_space/desktop_disk_space_method_channel.dart';

void main() {
  MethodChannelDesktopDiskSpace platform = MethodChannelDesktopDiskSpace();
  const MethodChannel channel = MethodChannel('desktop_disk_space');

  TestWidgetsFlutterBinding.ensureInitialized();

  // setUp(() {
  //   channel.setMockMethodCallHandler((MethodCall methodCall) async {
  //     return '42';
  //   });
  // });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  // test('getPlatformVersion', () async {
  //   expect(await platform.getPlatformVersion(), '42');
  // });

  test('getFreeSpace', () async {
    DartPluginRegistrant.ensureInitialized();
    WidgetsFlutterBinding.ensureInitialized();
    final version = await channel.invokeMethod('getFreeSpace', {'drive' : "."});

    // final space = await platform.getFreeSpace("C:\\");
    print(version);
    // expect(await platform.getFreeSpace("d"), '42');
  });
}
