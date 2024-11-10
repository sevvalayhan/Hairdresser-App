import 'package:flutter/material.dart';
import 'package:hairdresser_project/widgets/custom_navigation_bar.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(bottomNavigationBar: CustomNavigationBar(),);
  }
}