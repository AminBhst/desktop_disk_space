import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:desktop_disk_space/desktop_disk_space.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _freeSpace = 0;
  final _desktopDiskSpacePlugin = DesktopDiskSpace.instance;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    int freeSpace;
    try {
      freeSpace =
          await _desktopDiskSpacePlugin.getTotalSpace() ?? 0;
    } on PlatformException {
      freeSpace = 0;
    }

    if (!mounted) return;

    setState(() {
      _freeSpace = freeSpace;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Desktop Disk Space Example'),
        ),
        body: Center(
          child: Text('Free space: $_freeSpace\n'),
        ),
      ),
    );
  }
}
