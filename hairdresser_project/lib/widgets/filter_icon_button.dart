import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';

class FilterIconButton extends StatelessWidget {
  const FilterIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveMesurement.asWidth(context, 12),
      height: ResponsiveMesurement.asHeight(context, 10),
      child: CircleAvatar(
        backgroundColor: CustomColors.searchBarColor,
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.tune_rounded,
            color: CustomColors.lightPink,
          ),
        ),
      ),
    );
  }
}
