import 'package:get/get.dart';
import 'package:hairdresser_project/models/post.dart';
import 'package:hairdresser_project/repositories/post_repository.dart';

class PostController extends GetxController {
  final _postList = <Post>[].obs;
  final _fitleredPostList = <Post>[].obs;

  List<Post> get postList => _postList;
  set postList(List<Post> value) {
    _postList.assignAll(value);
  }

  List<Post> get filteredPostList => _fitleredPostList;
  set filteredPostList(List<Post> value) {
    _fitleredPostList.assignAll(value);
  }

  @override
  void onReady() async {
    await fetchPosts();
    // postList.assignAll(posts);
    //filteredPostList.assignAll(postList);
  }

  final PostRepository postService = PostRepository();
  Future<void> fetchPosts() async {
    try {
      var fetchedPosts = await postService.fetchAllPosts();
     
      if (fetchedPosts != null) {
        postList.assignAll(fetchedPosts);
      }
    } catch (e) {
      Get.snackbar('Error', 'Could not fetch posts: $e');
    }
  }

  Future<void> addPost(Post post) async {
    try {
      var newPost = await postService.addPost(post);
      if (newPost != null) {
        postList.add(newPost);
      }
    } catch (e) {
      Get.snackbar('Error', 'Could not add post: $e');
    }
  }

  Future<void> updatePost(int postId, Post updatedPost) async {
    try {
      var updated = await postService.updatePost(postId, updatedPost);
      if (updated != null) {
        int index = postList.indexWhere((post) => post.id == postId);
        if (index != -1) {
          postList[index] = updated;
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Could not update post: $e');
    }
  }

  Future<void> deletePost(int postId) async {
    try {
      var result = await postService.deletePost(postId);
      if (result) {
        postList.removeWhere((post) => post.id == postId);
      }
    } catch (e) {
      Get.snackbar('Error', 'Could not delete post: $e');
    }
  }

  // void filterPosts(String categoryName) {
  //   if (categoryName == "Hepsi") {
  //     filteredPostList.assignAll(postList);
  //   } else {
  //     filteredPostList.assignAll(postList
  //         .where((post) => post.category.categoryName == (categoryName))
  //         .toList());
  //   }
  // }
}
