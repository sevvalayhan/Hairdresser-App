import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/controllers/post_controller.dart';
import 'package:hairdresser_project/modules/post/widgets/post_card.dart';

// ignore: must_be_immutable
class PostListPage extends StatelessWidget {
  PostListPage({super.key});

  PostController postController = Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    print("post list lenght: ${postController.postList.length}");
    return Obx(() => SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              if (postController.postList.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PostCard(
                    post: postController.postList[index],
                  ),
                );
              } else {
                return const SizedBox(child: Text("data"));
              }
            },
            childCount: postController.postList.length > 10
                ? 10
                : postController.postList.length,
          ),
        ));
  }
}
