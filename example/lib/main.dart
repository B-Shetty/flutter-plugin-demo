import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:trial_plugin/trial_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  String _pluginMessage = "Null";
  final _trialPlugin = TrialPlugin();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    String pluginMessage;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _trialPlugin.getPlatformVersion() ?? 'Unknown platform version';
      pluginMessage = await _trialPlugin.getName() ?? "Unknown message";
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      pluginMessage = 'Failed to get plugin message.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _pluginMessage = pluginMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: Center(
          child: Column(
            children: [
               Text('Plugin Message : $_pluginMessage'),
                Text('Running on: $_platformVersion\n')
            ],
          )
          ),
      ),
    );
  }
}
