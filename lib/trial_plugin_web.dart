// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter

import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:web/web.dart' as web;

import 'trial_plugin_platform_interface.dart';

/// A web implementation of the TrialPluginPlatform of the TrialPlugin plugin.
class TrialPluginWeb extends TrialPluginPlatform {
  /// Constructs a TrialPluginWeb
  TrialPluginWeb();

  static void registerWith(Registrar registrar) {
    TrialPluginPlatform.instance = TrialPluginWeb();
  }

  /// Returns a [String] containing the version of the platform.
  @override
  Future<String?> getPlatformVersion() async {
    final version = web.window.navigator.userAgent;
    return version;
  }

  @override
  Future<String?> getName() async {
    return "Checking the plugin in WEB";
  }
}
