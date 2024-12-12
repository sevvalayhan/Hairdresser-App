import 'package:flutter/widgets.dart';
import 'package:hairdresser_project/screens/dashboard/layouts/mobile_dashboard_screen.dart';
import 'package:hairdresser_project/screens/dashboard/layouts/web_dashboard_screen.dart';
import 'package:hairdresser_project/utils/responsive.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: MobileDashboardScreen(),
      desktop: const WebDashboardScreen(),
    );
  }
}
