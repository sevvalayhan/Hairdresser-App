import 'package:flutter/material.dart';
import 'package:hairdresser_project/screens/home/layouts/mobile/mobile_home_screen.dart';
import 'package:hairdresser_project/screens/home/layouts/web_home_screen.dart';
import 'package:hairdresser_project/utils/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: MobileHomeScreen(), desktop: const WebHomeScreen());
  }
}