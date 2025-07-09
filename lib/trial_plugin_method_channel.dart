import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'trial_plugin_platform_interface.dart';

/// An implementation of [TrialPluginPlatform] that uses method channels.
class MethodChannelTrialPlugin extends TrialPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('trial_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }

  @override
  Future<String?> getName() async {
    final res = await methodChannel.invokeListMethod<String>('getName');
    return res!.lastOrNull;
  }
}
