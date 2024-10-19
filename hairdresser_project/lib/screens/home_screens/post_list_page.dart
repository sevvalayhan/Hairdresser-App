import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/controllers/home_page_controller.dart';
import 'package:hairdresser_project/controllers/post_controller.dart';
import 'package:hairdresser_project/models/hairdresser.dart';
import 'package:hairdresser_project/models/post.dart';
import 'package:hairdresser_project/screens/search_page.dart';
import 'package:hairdresser_project/static/custom_colors.dart';
import 'package:hairdresser_project/widgets/custom_search_bar.dart';
import 'package:hairdresser_project/modules/post_module/post_card.dart';

class PostListPage extends StatefulWidget {
  const PostListPage({super.key});

  @override
  State<PostListPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  PostController postController = Get.put(PostController());
  HomePageController homePageController = Get.put(HomePageController());

  final List<String> categoryNames = [
    "Saç Kesimi",
    "Cilt Bakımı",
    "Saç Bakımı",
    "Saç Boyama",
    "Makyaj"
  ];

  final List<Post> postList = [
    /* Post(
      postMediaList: [
        PostMedia(
            mediaUrl:
                "https://images.unsplash.com/photo-1518917999076-3b7d7f9b80ee",
            mediaType: MediaType.image),
        //  PostMedia(mediaUrl: "assets/videos/video.mp4", mediaType: MediaType.video),
        PostMedia(
            mediaUrl: "https://www.w3schools.com/html/mov_bbb.mp4",
            mediaType: MediaType.video),
      ],
      hairdresser: Hairdresser(name: "Şevval", surname: "Ayhan"),
      categoryName: "Saç Kesimi",
      content:
          "Where can I get some?There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
    ),*/
    Post(
      hairdresser: Hairdresser(name: "Zülal", surname: "Ayhan"),
      categoryName: "Cilt Bakımı",
      content:
          "Where can I get some?There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.",
    )
  ];

  @override
  void initState() {
    super.initState();
    postController.postList = postList;
    postController
        .filterPosts(categoryNames[homePageController.selectedIndex.value]);
    print(postController.filteredPostList);
  }

  @override
  Widget build(BuildContext context) {
    print(
        'isSearchBarSelected: ${homePageController.isSearchBarSelected.value}');

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(
              size: size,
            ),
            homePageController.isSearchBarSelected.value
                ? const CustomSearchPage()
                : Column(
                    children: [
                      CategoryButtonList(
                        categoryNames: categoryNames,
                      ),
                      SizedBox(
                        height: size.height,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: postController.filteredPostList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: PostCard(
                                  size: size,
                                  post: postController.filteredPostList[index],
                                ),
                              );
                            }),
                      )
                    ],
                  )
          ],
        ),
      ),
    ));
  }
}

class CategoryButtonList extends StatefulWidget {
  const CategoryButtonList({
    super.key,
    required this.categoryNames,
  });

  final List<String> categoryNames;

  @override
  State<CategoryButtonList> createState() => _CategoryButtonListState();
}

class _CategoryButtonListState extends State<CategoryButtonList> {
  final PostController postController = Get.put(PostController());
  final HomePageController homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 50,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.categoryNames.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(.8),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                  child: ElevatedButton(
                      onPressed: () {
                        postController.filterPosts(widget.categoryNames[index]);
                        homePageController.selectedIndex.value = index;
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              homePageController.selectedIndex.value == index
                                  ? CustomColors.lightPink.withOpacity(.3)
                                  : Colors.white,
                          shadowColor: CustomColors.lightPink.withOpacity(.4)),
                      child: Text(
                        widget.categoryNames[index],
                        style: TextStyle(
                            color:
                                homePageController.selectedIndex.value == index
                                    ? Colors.black
                                    : const Color.fromARGB(137, 44, 43, 43)
                                        .withOpacity(.8),
                            fontWeight:
                                homePageController.selectedIndex.value == index
                                    ? FontWeight.bold
                                    : FontWeight.normal),
                      )),
                ),
              );
            },
          )),
    );
  }
}
