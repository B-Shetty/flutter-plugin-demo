import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'trial_plugin_method_channel.dart';

abstract class TrialPluginPlatform extends PlatformInterface {
  /// Constructs a TrialPluginPlatform.
  TrialPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static TrialPluginPlatform _instance = MethodChannelTrialPlugin();

  /// The default instance of [TrialPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelTrialPlugin].
  static TrialPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TrialPluginPlatform] when
  /// they register themselves.
  static set instance(TrialPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getName() {
    throw UnimplementedError("getName() has not been implemented");
  }
}
