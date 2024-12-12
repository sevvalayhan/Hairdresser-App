import 'package:get/get.dart';
import 'package:hairdresser_project/models/address.dart';
import 'package:hairdresser_project/models/barber.dart';
import 'package:hairdresser_project/models/category.dart';
import 'package:hairdresser_project/models/country.dart';
import 'package:hairdresser_project/models/district.dart';
import 'package:hairdresser_project/models/post.dart';
import 'package:hairdresser_project/models/post_media.dart';
import 'package:hairdresser_project/models/province.dart';
import 'package:hairdresser_project/models/user.dart';
import 'package:hairdresser_project/repositories/post_repository.dart';

class PostController extends GetxController {
  final _postList = <Post>[].obs;
  final _fitleredPostList = <Post>[].obs;

  final List<Post> posts = [
    Post(
        postMediaList: [
          PostMedia(
              id: 1,
              mediaUrl:
                  "http://127.0.0.1:8000/media/barber_profile_images/WhatsApp_G%C3%B6rsel_2024-11-12_saat_15.44.54_11e7f5fe.jpg",
              mediaType: MediaType.image)
        ],
        id: 1,
        barber: Barber(
            id: 1,
            user: User(
                id: 1,
                email: "email",
                phoneNumber: "phoneNumber",
                addresses: [
                  Address(
                      id: 1,
                      district: District(
                          id: 1,
                          districtName: "districtName",
                          province: Province(
                              id: 1,
                              provinceName: "provinceName",
                              country: Country(
                                  id: 1,
                                  countryCode: 1,
                                  countryName: "countryName"))),
                      addressType: 1,
                      buildingNo: "buildingNo",
                      street: "street",
                      region: "region",
                      postalCode: 1232,
                      description: "description",
                      coordinate: "coordinate",
                      userId: 1)
                ]),
            identityNumber: "identitiyNumber",
            firstName: "firstName",
            lastName: "lastName",
            bio: "bio",
            email: "email",
            profileImage: "profileImage",
            identityCard: "identityCard",
            status: 1,
            shopName: "shopName",
            isImproved: true),
        category: Category(
            id: 1,
            categoryName: "categoryName",
            createdAt: "DateTime.now()",
            categoryImage: "categoryImage"),
        content: "content",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    Post(
        //    postMediaList: [PostMedia(id: 1, mediaUrl: "", mediaType: MediaType.image)],

        id: 1,
        barber: Barber(
            id: 1,
            user: User(
                id: 1,
                email: "email",
                phoneNumber: "phoneNumber",
                addresses: [
                  Address(
                      id: 1,
                      district: District(
                          id: 1,
                          districtName: "districtName",
                          province: Province(
                              id: 1,
                              provinceName: "provinceName",
                              country: Country(
                                  id: 1,
                                  countryCode: 1,
                                  countryName: "countryName"))),
                      addressType: 1,
                      buildingNo: "buildingNo",
                      street: "street",
                      region: "region",
                      postalCode: 1232,
                      description: "description",
                      coordinate: "coordinate",
                      userId: 1)
                ]),
            identityNumber: "identitiyNumber",
            firstName: "firstName",
            lastName: "lastName",
            bio: "bio",
            email: "email",
            profileImage: "profileImage",
            identityCard: "identityCard",
            status: 1,
            shopName: "shopName",
            isImproved: true),
        category: Category(
            id: 1,
            categoryName: "categoryName",
            createdAt: "DateTime.now()",
            categoryImage: "categoryImage"),
        content: "content",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    Post(
        id: 1,
        barber: Barber(
            id: 1,
            user: User(
                id: 1,
                email: "email",
                phoneNumber: "phoneNumber",
                addresses: [
                  Address(
                      id: 1,
                      district: District(
                          id: 1,
                          districtName: "districtName",
                          province: Province(
                              id: 1,
                              provinceName: "provinceName",
                              country: Country(
                                  id: 1,
                                  countryCode: 1,
                                  countryName: "countryName"))),
                      addressType: 1,
                      buildingNo: "buildingNo",
                      street: "street",
                      region: "region",
                      postalCode: 1232,
                      description: "description",
                      coordinate: "coordinate",
                      userId: 1)
                ]),
            identityNumber: "identitiyNumber",
            firstName: "firstName",
            lastName: "lastName",
            bio: "bio",
            email: "email",
            profileImage: "profileImage",
            identityCard: "identityCard",
            status: 1,
            shopName: "shopName",
            isImproved: true),
        category: Category(
            id: 1,
            categoryName: "categoryName",
            createdAt: "DateTime.now()",
            categoryImage: "categoryImage"),
        content: "content",
        createdAt: DateTime.now(),
        updatedAt: DateTime.now())
  ];

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
    //await fetchPosts();
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
