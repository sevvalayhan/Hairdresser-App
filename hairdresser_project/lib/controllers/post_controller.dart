import 'package:get/get.dart';
import 'package:hairdresser_project/models/post.dart';
import 'package:hairdresser_project/repositories/post_repository.dart';

class PostController extends GetxController {
  final _postList = <Post>[].obs;
  final _fitleredPostList = <Post>[].obs;

  // final List<Post> posts = [
  //   Post(
  //     id: 1,
  //     createdAt: DateTime.now(),
  //     updatedAt: DateTime.now(),
  //     postMediaList: [
  //       PostMedia(
  //           mediaUrl:
  //               "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
  //           mediaType: MediaType.image),
  //       PostMedia(
  //           mediaUrl: "assets/videos/video.mp4", mediaType: MediaType.video),
  //       PostMedia(
  //           mediaUrl: "https://www.w3schools.com/html/mov_bbb.mp4",
  //           mediaType: MediaType.video),
  //     ],
  //     hairdresser: Hairdresser(name: "Şevval", surname: "Ayhan"),
  //     categoryName: "Cilt Bakımı",
  //     content:
  //         "Where can I get some?There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
  //   ),
  //   Post(
  //     id: 1,
  //     createdAt: DateTime.now(),
  //     updatedAt: DateTime.now(),
  //     postMediaList: [
  //       PostMedia(
  //           mediaUrl:
  //               "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
  //           mediaType: MediaType.image),
  //       PostMedia(
  //           mediaUrl: "assets/videos/video.mp4", mediaType: MediaType.video),
  //       PostMedia(
  //           mediaUrl: "https://www.w3schools.com/html/mov_bbb.mp4",
  //           mediaType: MediaType.video),
  //     ],
  //     hairdresser: Hairdresser(name: "Şevval", surname: "Ayhan"),
  //     categoryName: "Cilt Bakımı",
  //     content:
  //         "Where can I get some?There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
  //   ),
  //   Post(
  //     id: 1,
  //     createdAt: DateTime.now(),
  //     updatedAt: DateTime.now(),
  //     postMediaList: [
  //       PostMedia(
  //           mediaUrl:
  //               "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
  //           mediaType: MediaType.image),
  //       PostMedia(
  //           mediaUrl: "assets/videos/video.mp4", mediaType: MediaType.video),
  //       PostMedia(
  //           mediaUrl: "https://www.w3schools.com/html/mov_bbb.mp4",
  //           mediaType: MediaType.video),
  //     ],
  //     hairdresser: Hairdresser(name: "Şevval", surname: "Ayhan"),
  //     categoryName: "Cilt Bakımı",
  //     content:
  //         "Where can I get some?There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
  //   ),
  //   Post(
  //     id: 1,
  //     createdAt: DateTime.now(),
  //     updatedAt: DateTime.now(),
  //     postMediaList: [
  //       PostMedia(
  //           mediaUrl:
  //               "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
  //           mediaType: MediaType.image),
  //       PostMedia(
  //           mediaUrl: "assets/videos/video.mp4", mediaType: MediaType.video),
  //       PostMedia(
  //           mediaUrl: "https://www.w3schools.com/html/mov_bbb.mp4",
  //           mediaType: MediaType.video),
  //     ],
  //     hairdresser: Hairdresser(name: "Şevval", surname: "Ayhan"),
  //     categoryName: "Makyaj",
  //     content:
  //         "Where can I get some?There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
  //   ),
  // ];

  // final List<Post> posts = [
  //   Post(
  //       id: 1,
  //       barber: Barber(
  //           user: User(
  //               id: 1,       
  //               email: "email",
  //               phoneNumber: "phoneNumber"),
  //           firstName: "firstName",
  //           lastName: "lastName",
  //           bio: "bio",
  //           email: "email",
  //           profileImage: "profileImage",
  //           identityCard: "identityCard", identityNumber: ''),
  //       category: Category(
  //           id: 1,
  //           categoryName: "categoryName",
  //           description: "description",
  //           imageUrl: "imageUrl"),
  //       content: "content",
  //       createdAt: DateTime.now(),
  //       updatedAt: DateTime.now())
  // ];
  List<Post> posts = []; 
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
   // await fetchPosts();
    postList.assignAll(posts);
    filteredPostList.assignAll(postList);
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

  void filterPosts(String categoryName) {
    if (categoryName == "Hepsi") {
      filteredPostList.assignAll(postList);
    } else {
      filteredPostList.assignAll(postList
          .where((post) => post.category.categoryName == (categoryName))
          .toList());
    }
  }
}
