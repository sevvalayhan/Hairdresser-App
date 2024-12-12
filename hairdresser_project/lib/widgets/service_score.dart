import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';

class ServiceScore extends StatelessWidget {
  const ServiceScore({
    super.key, 
  });
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveMesurement.asWidth(context, 12),
      height: ResponsiveMesurement.asHeight(context, 2.5),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: CustomColors.lila.withOpacity(.5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.star,
              color: CustomColors.yellow,
              size: 15,
            ),
            Text(
              "4.5",
              style: montserratSmall,
            )
          ],
        ),
      ),
    );
  }
}
