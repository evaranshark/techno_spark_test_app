import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:techno_spark_test_app/dimensions.dart';

import 'media_query_extension.dart';

class Helpers {
  static T responsiveDeviceValue<T>(
    BuildContext context, {
    required T phone,
    required T tablet,
    T? desktop,
  }) {
    var data = MediaQuery.of(context);
    if (data.deviceType == DeviceType.phone) return phone;
    if (data.deviceType == DeviceType.tablet) return tablet;
    if (data.deviceType == DeviceType.desktop) return desktop ?? tablet;
    return phone;
  }

  static T responsiveWidthValue<T>(
    BuildContext context, {
    required T small,
    required T medium,
    required T large,
  }) {
    var deviceWidth = MediaQuery.of(context).size.width;
    if (deviceWidth < WidthBreakpoints.compact) return small;
    if (deviceWidth < WidthBreakpoints.medium) return medium;
    if (deviceWidth < WidthBreakpoints.large) return large;
    return large;
  }

  static bool get isMobileDevice =>
      !kIsWeb && (Platform.isIOS || Platform.isAndroid);
  static bool get isDesktopDevice =>
      !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
  static bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
  static bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;
}
