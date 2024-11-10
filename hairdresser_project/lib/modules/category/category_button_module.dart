import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/controllers/home_page_controller.dart';
import 'package:hairdresser_project/controllers/post_controller.dart';
import 'package:hairdresser_project/controllers/service_controller.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';

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
  final ServiceController serviceController = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    double horizontalSize = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 40,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.categoryNames.length,
            itemBuilder: (BuildContext context, int index) {
              return Obx(
                () => Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: horizontalSize * .005),
                  child: categoryButton(index),
                ),
              );
            },
          )),
    );
  }

  OutlinedButton categoryButton(int index) {
    return OutlinedButton(
        onPressed: () {
          print(index);
          print("post list lenght${postController.filteredPostList.length}");
          print("service list lenght${serviceController.filteredServiceList.length}");
          serviceController.filterService(widget.categoryNames[index]);
          postController.filterPosts(widget.categoryNames[index]);
          homePageController.selectedCategoryIndex.value = index;
        },
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: CustomColors.lightPink),
            backgroundColor:
                homePageController.selectedCategoryIndex.value == index
                    ? CustomColors.lightPink
                    : Colors.white,
            shadowColor: CustomColors.lightPink),
        child: Text(
          widget.categoryNames[index],
          style: TextStyle(
              color: homePageController.selectedCategoryIndex.value == index
                  ? Colors.white
                  : CustomColors.lightPink,
              fontWeight:
                  homePageController.selectedCategoryIndex.value == index
                      ? FontWeight.bold
                      : FontWeight.normal),
        ));
  }
}
