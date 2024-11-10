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
  return Obx(() => SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            if (postController.filteredPostList.isNotEmpty) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PostCard(
                  post: postController.filteredPostList[index],
                ),
              );
            } else {
              return const Text("data");
            }
          },
          childCount: postController.filteredPostList.length,
        ),
      ));
}

}
