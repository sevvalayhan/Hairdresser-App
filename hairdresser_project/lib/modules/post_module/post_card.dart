import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/models/post.dart';
import 'package:hairdresser_project/modules/post_module/post_media_widget.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.size,
    required this.post,
  });
  final Post post;
  final Size size;

  String formatDate(DateTime createdAt) {
    final Duration difference = DateTime.now().difference(post.createdAt!);

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
    String createdAt = formatDate(post.createdAt!);
    return GestureDetector(
      onTap: () {
        print("card");
      },
      child: Card(
        color: Colors.white,
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
                              "${post.hairdresser.name} ${post.hairdresser.surname}",
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
                ]),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Padding(
                padding: EdgeInsets.zero,
                child: PostMediaWidget(post: post,),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  post.content.length > 250 ? post.content : post.content,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                  style: montserratMedium,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          )
        ]),
      ),
    );
  }
}
