import 'trial_plugin_platform_interface.dart';

class TrialPlugin {
  Future<String?> getPlatformVersion() {
    return TrialPluginPlatform.instance.getPlatformVersion();
  }

  Future<String?> getName() {
    return TrialPluginPlatform.instance.getName();
  }
}
