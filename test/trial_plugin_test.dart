import 'package:flutter_test/flutter_test.dart';
import 'package:trial_plugin/trial_plugin.dart';
import 'package:trial_plugin/trial_plugin_platform_interface.dart';
import 'package:trial_plugin/trial_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTrialPluginPlatform
    with MockPlatformInterfaceMixin
    implements TrialPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TrialPluginPlatform initialPlatform = TrialPluginPlatform.instance;

  test('$MethodChannelTrialPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTrialPlugin>());
  });

  test('getPlatformVersion', () async {
    TrialPlugin trialPlugin = TrialPlugin();
    MockTrialPluginPlatform fakePlatform = MockTrialPluginPlatform();
    TrialPluginPlatform.instance = fakePlatform;

    expect(await trialPlugin.getPlatformVersion(), '42');
  });
}
