import 'package:flutter/material.dart';
import 'package:hairdresser_project/widgets/custom_navigation_bar.dart';

class CustomSearchPage extends StatefulWidget {
  const CustomSearchPage({super.key});

  @override
  State<CustomSearchPage> createState() => _CustomSearchPageState();
}

class _CustomSearchPageState extends State<CustomSearchPage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(bottomNavigationBar: CustomNavigationBar(),);
  }
}