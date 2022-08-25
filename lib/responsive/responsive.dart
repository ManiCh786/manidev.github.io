import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget desktop;
  final Widget tablet;
  final Widget mobile;
  const Responsive(
      {Key? key,
      required this.desktop,
      required this.tablet,
      required this.mobile})
      : super(key: key);
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1000;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1000 &&
      MediaQuery.of(context).size.width >= 600;
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth >= 1000) {
        return desktop;
      } else if (constraints.maxWidth < 1000 && constraints.maxWidth >= 600) {
        return tablet;
      } else {
        return mobile;
      }
    }));
  }
}
