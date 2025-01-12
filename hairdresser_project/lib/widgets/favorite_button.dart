import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: CustomColors.white.withOpacity(.5),
      radius: 15,
      child: Center(
        child: InkWell(
          child: Icon(
            Icons.favorite_border,
            color: CustomColors.lightPink,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}