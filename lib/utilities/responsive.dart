import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive(
      {Key? key, required this.mobile, this.tablet, required this.desktop})
      : super(key: key);

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  static const int mobileThreshold = 500;
  static const int tabletThreshold = 850;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileThreshold;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < tabletThreshold &&
      MediaQuery.of(context).size.width >= mobileThreshold;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= tabletThreshold;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (size.width >= tabletThreshold) {
      return desktop;
    } else if (size.width >= mobileThreshold && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
