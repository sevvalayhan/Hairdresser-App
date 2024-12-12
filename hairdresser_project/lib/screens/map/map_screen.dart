import 'package:flutter/material.dart';
import 'package:hairdresser_project/screens/map/layouts/mobile_map_screen.dart';
import 'package:hairdresser_project/screens/map/layouts/web_map_screen.dart';
import 'package:hairdresser_project/utils/responsive.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(mobile: MobileMapScreen(), desktop: WebMapScreen());
  }
}
