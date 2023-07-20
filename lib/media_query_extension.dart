import 'package:flutter/widgets.dart';

import 'dimensions.dart';

extension DeviceDimensionsData on MediaQueryData {
  DeviceType get deviceType {
    if (size.shortestSide < WidthBreakpoints.compact) {
      return DeviceType.phone;
    }
    if (size.shortestSide < WidthBreakpoints.medium) {
      return DeviceType.tablet;
    }
    return DeviceType.desktop;
  }
}

enum DeviceType { xSmall, phone, tablet, desktop }
