import 'package:flutter/material.dart';
import 'package:hairdresser_project/widgets/custom_navigation_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(bottomNavigationBar: CustomNavigationBar(),);
  }
}