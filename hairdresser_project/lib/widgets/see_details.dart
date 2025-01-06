import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';

class SeeDetails extends StatelessWidget {
  const SeeDetails({
    super.key,
    required this.detailsName,
    required this.pageName,
    required this.id,
  });

  final String detailsName;
  final String pageName;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            detailsName,
            style: montserratSemiBold,
          ),
          TextButton(
            onPressed: () {
              Get.toNamed(pageName, id: id);
            },
            child: Row(
              children: [
                Text("Devamını gör",
                    style: montserratMedium.copyWith(
                      color: CustomColors.lightPink,
                    )),
                Icon(
                  Icons.keyboard_arrow_right_rounded,
                  color: CustomColors.lightPink,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
