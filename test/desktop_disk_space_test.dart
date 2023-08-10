import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:desktop_disk_space/desktop_disk_space.dart';
import 'package:desktop_disk_space/desktop_disk_space_platform_interface.dart';
import 'package:desktop_disk_space/desktop_disk_space_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDesktopDiskSpacePlatform
    with MockPlatformInterfaceMixin
    implements DesktopDiskSpacePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<String?> getFreeSpace(String drive) {
    // TODO: implement getFreeSpace
    throw UnimplementedError();
  }
}

void main() {
  final DesktopDiskSpacePlatform initialPlatform = DesktopDiskSpacePlatform.instance;

  test('$MethodChannelDesktopDiskSpace is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDesktopDiskSpace>());
  });


  test('getFreeSpace', () async {
    WidgetsFlutterBinding.ensureInitialized();
    final space = await DesktopDiskSpace.instance.getFreeSpace("C:\\");
  });

}
