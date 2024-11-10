import 'package:flutter/material.dart';
import 'package:hairdresser_project/widgets/custom_navigation_bar.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
 return  Scaffold(bottomNavigationBar: CustomNavigationBar(),);
  }
}