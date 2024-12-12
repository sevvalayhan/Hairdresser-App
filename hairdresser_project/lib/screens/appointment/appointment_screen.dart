import 'package:flutter/material.dart';
import 'package:hairdresser_project/screens/appointment/layouts/mobile_appointment_screen.dart';
import 'package:hairdresser_project/screens/appointment/layouts/web_appointment_screen.dart';
import 'package:hairdresser_project/utils/responsive.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: MobileAppointmentScreen(), desktop: WebAppointmentScreen());
  }
}
