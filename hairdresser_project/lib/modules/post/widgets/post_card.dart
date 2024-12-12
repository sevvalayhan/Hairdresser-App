import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/models/post.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/modules/post/widgets/post_media_widget.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';

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
          border: Border.all(
              color: CustomColors.black.withOpacity(.3), width: .5),
          borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            "${post.barber.firstName} ${post.barber.firstName}",
                            style: montserratSemiBold),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          createdAt,
                          style: montserratSmall,
                        ),
                      ],
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {print( "post Detail");}, icon: const Icon(Icons.more_horiz)),
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
        GestureDetector(
           onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border)
                          // : Icon(
                          //     Icons.favorite,
                          //     color: CustomColors.lightPink,
                          //   ),
                          ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.mode_comment_outlined)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.share)),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Iconsax.save_2_copy),
                  )
                ]),
          ),
        ),
        const SizedBox(
          height: 5,
        )
      ]),
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
