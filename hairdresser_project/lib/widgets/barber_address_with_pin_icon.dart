import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/models/barber.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';

class BarberAddressWithPinIcon extends StatelessWidget {
  const BarberAddressWithPinIcon({
    super.key,
    required this.barber,
    required this.style,
    required this.locationIcon,
    required this.iconSize, required this.stringSize,
  });

  final Barber barber;
  final TextStyle style;
  final double iconSize;
  final Icon locationIcon;
  final double stringSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          locationIcon.icon,
          color: CustomColors.lightPink,
          size: iconSize,
        ),
        const SizedBox(
          width: 1,
        ),
        SizedBox(
          width: ResponsiveMesurement.asWidth(context, stringSize),
          child: Text(
         " ${barber.user.addresses[0].district.districtName}, ${barber.user.addresses[0].district.province.provinceName},  ",
                style: style,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class BarberAddressWithImageIcon extends StatelessWidget {
  const BarberAddressWithImageIcon({
    super.key,
    required this.barber,
    required this.style,
    required this.iconImageUrl,
    required this.iconSize,
  });

  final Barber barber;
  final TextStyle style;
  final double iconSize;
  final String iconImageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageIcon(
          AssetImage(iconImageUrl),
          color: CustomColors.lightPink,
          size: iconSize,
        ),
        const SizedBox(
          width: 1,
        ),
        Text(
          "${barber.user.addresses[0].district.province.provinceName}, ${barber.user.addresses[0].district.districtName} ",
          style: style,
        ),
      ],
    );
  }
}
