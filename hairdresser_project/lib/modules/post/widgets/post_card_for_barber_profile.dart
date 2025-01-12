import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/models/post.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/modules/post/widgets/post_media_widget.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

// ignore: must_be_immutable
class PostCardForBarberProfile extends StatelessWidget {
  const PostCardForBarberProfile({
    super.key,
    required this.post,
  });
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        width: ResponsiveMesurement.asWidth(context, 70),
        decoration: BoxDecoration(
            color: CustomColors.white,
            border: Border.all(
              color: CustomColors.lightPink.withOpacity(.4),
            ),
            borderRadius: BorderRadius.circular(12)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          barberInformation(context),
          postBody(context),
          //icons(),
        ]),
      ),
    );
  }

  Padding barberInformation(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: SizedBox(
                  height: ResponsiveMesurement.asHeight(context, 3),
                  width: ResponsiveMesurement.asHeight(context, 3),
                  child:
                      CustomImageFetcher(imageUrl: post.barber.profileImage),
                ),
              ),const SizedBox(width: 10,),
              Text(post.barber.shopName, style: montserratSemiBold),
            ],
          ),
        );
  }

  Column postBody(BuildContext context) {
    return Column(
      children: [
        postContentText(context),
        post.postMediaList.isNotEmpty
            ? PostMediaWidget(
                postMediaHeight: ResponsiveMesurement.asHeight(context, 22),
                post: post)
            : const SizedBox()
      ],
    );
  }

  Padding icons() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Icon(
              Icons.favorite_border,
              color: CustomColors.lightPink.withOpacity(.5),
            ),
            Icon(
              Icons.mode_comment_outlined,
              color: CustomColors.lightPink.withOpacity(.5),
            ),
            Icon(
              Icons.share,
              color: CustomColors.lightPink.withOpacity(.5),
            )
          ],
        ),
        Icon(
          Iconsax.save_2_copy,
          color: CustomColors.lightPink.withOpacity(.5),
        ),
      ]),
    );
  }

  Padding postContentText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        child: Text(post.content,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: montserratSmall),
      ),
    );
  }
}
