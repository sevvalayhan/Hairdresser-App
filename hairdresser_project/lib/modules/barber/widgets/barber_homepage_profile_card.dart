import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hairdresser_project/models/barber.dart';

class BarberHomepageProfileCard extends StatelessWidget {
  const BarberHomepageProfileCard({super.key, required this.barber});
  final Barber barber;

  @override
  Widget build(BuildContext context) {
    double horizontalSize = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalSize * .002,),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 40,
                child: ClipOval(
                    child: SizedBox.fromSize(
                        size: const Size.fromRadius(50),
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: barber.profileImageUrl)))),
            const SizedBox(
              height: 10,
            ),
            Text(
              (barber.barberName + barber.barberSurname).length > 10
                  ? "${("${barber.barberName} ${barber.barberSurname}").substring(0, 10)}..."
                  : "${barber.barberName} ${barber.barberSurname}",
              overflow: TextOverflow.ellipsis,
            ),
          
          ],
        ),
      ),
    );
  }
}
