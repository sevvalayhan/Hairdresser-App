import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';

class AppointmentButton extends StatelessWidget {
  const AppointmentButton({
    super.key,
  });
  // Function? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(        
        width: ResponsiveMesurement.asWidth(context, 40),
        height: ResponsiveMesurement.asHeight(context, 3.8),//3.8 details page için, 3.5 , result page için
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 10,
              shadowColor: CustomColors.black,
              backgroundColor: CustomColors.lightPink,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
            onPressed: () {},
            child: Text(
              "Randevu Al",
              style: montserratMedium.copyWith(color: CustomColors.white),
            )),
      ),
    );
  }
}
