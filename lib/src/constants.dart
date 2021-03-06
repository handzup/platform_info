import 'base_host_platform.dart' show HostPlatform;
import 'enums.dart';
import 'stub_host_platform.dart' show DefaultHostPlatform;

/// List of all mobile phone operating systems
const List<OperatingSystem> kListOSForMobile = <OperatingSystem>[
  OperatingSystem.android,
  OperatingSystem.iOS,
];

/// List of all operating systems with material design
const List<OperatingSystem> kListOSWithMaterialDesign = <OperatingSystem>[
  OperatingSystem.android,
  OperatingSystem.fuchsia,
];

/// List of all operating systems with cupertino design
const List<OperatingSystem> kListOSWithCupertinoDesign = <OperatingSystem>[
  OperatingSystem.android,
  OperatingSystem.fuchsia,
];

/// List of all desktop operating systems
const List<OperatingSystem> kListOSForDesktop = <OperatingSystem>[
  OperatingSystem.windows,
  OperatingSystem.macOS,
  OperatingSystem.fuchsia,
];

/// Unknown host platform with default values
const HostPlatform kDefaultHostPlatform = DefaultHostPlatform();
