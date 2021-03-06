// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'base_host_platform.dart';
import 'constants.dart';
import 'enums.dart';
import 'stub_host_platform.dart'
    // ignore: uri_does_not_exist
    if (dart.library.html) 'web_host_platform.dart'
    // ignore: uri_does_not_exist
    if (dart.library.io) 'io_host_platform.dart';

/// [Platform] info
/// Works on the web, mobile phones, desktops and console.
/// Provides platform information such as:
///   + Build mode
///      * release (release build mode)
///      * profile (profile build mode)
///      * debug (debug build mode)
///
///   + Host platform type
///      * io (desktops, mobile, console)
///      * web (browser)
///
///   + Operation system
///      * Fuchsia
///      * Linux
///      * MacOS
///      * Windows
///      * iOS
///      * Android
///      * Unknown
///
///   + Version
///
///   + Locale string
///
///   + The number of individual execution units of the machine.
///
///   + Operating system is known type
///
///   + Is mobile device (Android, iOS)
///
///   + Is desktop device (Windows, MacOS, Fuchsia)
///
///   + Is material (Android, Fuchsia)
///
///   + Is cupertino (MacOS, iOS)
///
///
class Platform implements ExtendedHostPlatform {
  @override
  HostPlatformType get type => _hostPlatform.type;

  @override
  OperatingSystem get operatingSystem => _hostPlatform.operatingSystem;

  @override
  String get version => _hostPlatform.version;

  @override
  String get locale => _hostPlatform.locale;

  @override
  int get numberOfProcessors => _hostPlatform.numberOfProcessors;

  @override
  bool get isOperatingSystemKnown => _isOperatingSystemKnown;
  bool _isOperatingSystemKnown;

  @override
  bool get isWeb => _hostPlatform.type == HostPlatformType.web;

  @override
  bool get isIO => _hostPlatform.type == HostPlatformType.io;

  @override
  bool get isMobile => _isMobile;
  bool _isMobile;

  @override
  bool get isDesktop => _isDesktop;
  bool _isDesktop;

  @override
  bool get isMaterial => _isMaterial;
  bool _isMaterial;

  @override
  bool get isCupertino => _isCupertino;
  bool _isCupertino;

  @override
  bool get isAndroid => operatingSystem == OperatingSystem.android;

  @override
  bool get isFuchsia => operatingSystem == OperatingSystem.fuchsia;

  @override
  bool get isIOS => operatingSystem == OperatingSystem.iOS;

  @override
  bool get isLinux => operatingSystem == OperatingSystem.linux;

  @override
  bool get isMacOS => operatingSystem == OperatingSystem.macOS;

  @override
  bool get isWindows => operatingSystem == OperatingSystem.windows;

  @override
  final BuildMode buildMode;

  /// Host platform
  /// contain info about host device
  final HostPlatform _hostPlatform;

  static BuildMode _getCurrentBuildMode() => () {
        if (const bool.fromEnvironment('dart.vm.product')) {
          return BuildMode.release;
        }
        var result = BuildMode.profile;
        assert(() {
          result = BuildMode.debug;
          return true;
        }(), '');
        return result;
      }();

  static HostPlatform _getHostPlatform() => getHostPlatform();

  /// Access to the Singleton instance of Platform
  static Platform get instance => _this;

  /// Short form to access the instance of Platform
  static Platform get I => _this;

  /// Singleton info about platform
  static final Platform _this = Platform._internal();
  Platform._internal()
      : _hostPlatform = _getHostPlatform(),
        buildMode = _getCurrentBuildMode() {
    _isOperatingSystemKnown = operatingSystem != OperatingSystem.unknown;
    _isMobile = kListOSForMobile.contains(operatingSystem);
    _isDesktop = kListOSForDesktop.contains(operatingSystem);
    _isMaterial = kListOSWithMaterialDesign.contains(operatingSystem);
    _isCupertino = kListOSWithCupertinoDesign.contains(operatingSystem);
  }

  @override
  int get hashCode => 0;

  @override
  bool operator ==(Object other) => other is Platform;

  @override
  String toString() => version;
}
