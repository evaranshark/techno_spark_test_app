import 'package:flutter/material.dart';

import 'helpers.dart';

class PageThemeWidget extends StatelessWidget {
  final Widget child;
  const PageThemeWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontSize: Helpers.responsiveDeviceValue<double>(
                    context,
                    phone: 16,
                    tablet: 20,
                    desktop: 24,
                  )),
              minimumSize: Helpers.responsiveDeviceValue<Size>(
                context,
                phone: const Size(64, 36),
                tablet: const Size(72, 40),
                desktop: const Size(128, 60),
              )),
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
              bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: Helpers.responsiveDeviceValue(
                      context,
                      phone: 20,
                      tablet: 24,
                      desktop: 26,
                    ),
                  ),
            ),
      ),
      child: child,
    );
  }
}
