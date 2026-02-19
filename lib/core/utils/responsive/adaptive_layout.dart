import 'package:doctor_appointment/core/utils/responsive/app_breakpoints.dart';
import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const AdaptiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        if (width < AppBreakpoints.mobile) {
          return mobile;
        } else if (width < AppBreakpoints.tablet) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }
}
