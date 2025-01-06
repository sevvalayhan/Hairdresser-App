import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';

class BackPageButton extends StatelessWidget {
  const BackPageButton({
    super.key,
    required this.route,
    required this.navigationKey,
  });
  final String route;
  final int navigationKey;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
      
        Get.back(id: navigationKey); //bunu yaptığım zaman evet bir önceki sayfaya gidiyor ama search sayfası sıfırlanıyor
      }, 
      icon: Icon(
        size: 20,
        Icons.arrow_back_ios_new,
        color: CustomColors.lightPink,
      ),
    );
  }
}
