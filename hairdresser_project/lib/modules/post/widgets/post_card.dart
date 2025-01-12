import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/models/post.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/modules/post/widgets/post_media_widget.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';

// ignore: must_be_immutable
class PostCard extends StatelessWidget {
    const PostCard({
    super.key,
    required this.post, 
  });
  final Post post;


  String formatDate(DateTime createdAt) {
    final Duration difference = DateTime.now().difference(post.createdAt);

    if (difference.inDays > 0) {
      return '${difference.inDays} gün önce';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} saat önce';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} dakika önce';
    } else {
      return 'Az önce';
    }
  }

  @override
  Widget build(BuildContext context) {
    String createdAt = formatDate(post.createdAt);
    return Container(
      decoration: BoxDecoration(
          color: CustomColors.white,
          border:
              Border.all(color: CustomColors.black.withOpacity(.3), width: .5),
          borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                barberProfileImage(context),
                //const Icon(Icons.person),
                const SizedBox(
                  width: 15,
                ),
                postDetails(createdAt),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz)),
          ]),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            postContentText(),
            post.postMediaList.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.zero,
                    child: PostMediaWidget( 
                      post: post,
                    ),
                  )
                : const SizedBox()
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(14),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      color: CustomColors.lightPink.withOpacity(.5),
                    )
                    // : Icon(
                    //     Icons.favorite,
                    //     color: CustomColors.lightPink,
                    //   ),
                    ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mode_comment_outlined,
                      color: CustomColors.lightPink.withOpacity(.5),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: CustomColors.lightPink.withOpacity(.5),
                    )),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Iconsax.save_2_copy,
                color: CustomColors.lightPink.withOpacity(.5),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 5,
        )
      ]),
    );
  }

  Column postDetails(String createdAt) {
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${post.barber.firstName} ${post.barber.lastName}",
                      style: montserratSemiBold),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    createdAt,
                    style: montserratSmall,
                  ),
                ],
              );
  }

  ClipRRect barberProfileImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(
        height: ResponsiveMesurement.asHeight(context, 5),
        width: ResponsiveMesurement.asHeight(context, 5),
        child: CustomImageFetcher(imageUrl: post.barber.profileImage),
      ),
    );
  }

  Padding postContentText() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ReadMoreText('${post.content}\n',
          trimMode: TrimMode.Line,
          trimLines: 2,
          colorClickableText: CustomColors.lightPink,
          trimCollapsedText: 'Devamını oku',
          trimExpandedText: 'Kapat',
          moreStyle: montserratMedium.copyWith(color: CustomColors.lightPink)),
    );
  }
}
