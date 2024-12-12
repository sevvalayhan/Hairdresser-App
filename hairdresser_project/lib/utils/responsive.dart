import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile; 
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile, 
    required this.desktop,
  });

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 900;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 900;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isDesktop(context)) {
          return desktop;}
        else {
          return mobile;
        }
      },
    );
  }
}
