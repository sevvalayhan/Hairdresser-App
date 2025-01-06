import 'package:flutter/material.dart';
import 'package:hairdresser_project/screens/barber/layouts/mobile/widgets/web_barbers_screen.dart.dart';
import 'package:hairdresser_project/screens/barber/layouts/mobile/widgets/mobile_barbers_screen.dart';
import 'package:hairdresser_project/utils/responsive.dart';

class BarbersPage extends StatelessWidget {
  const BarbersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(mobile: MobileBarbersPage(), desktop: WebBarbersPage());
  }
}