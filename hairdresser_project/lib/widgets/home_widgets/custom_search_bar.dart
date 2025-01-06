import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/controllers/home_page_controller.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/controllers/search_page_controller.dart';
import 'package:hairdresser_project/navigation/navigation_key.dart';
import 'package:hairdresser_project/routes/app_pages.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';

// ignore: must_be_immutable
class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({
    super.key,
  });

  final SearchPageController searchBarController =
      Get.put(SearchPageController());
  final HomePageController homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: CustomColors.lila.withOpacity(.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [ 
            const SizedBox(
              width: 5,
            ),
            Icon(Icons.search, color: CustomColors.lightPink),
            Expanded(
              child: TextField(
                controller: searchBarController.textController.value,
                onSubmitted: (value) {
                  Get.toNamed(AppRoutes.searchResultPage,
                      id: NavigationKey.home.index);
                },
                onChanged: (value) async {
                  searchBarController.checkIfTextFieldIsEmpty();
                  await searchBarController.updateSearchList();
                },
                style: montserratMedium,
                showCursor: true,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "Kuaför, hizmet ve stil ara...",
                  hintStyle: montserratMedium.copyWith(
                      color: CustomColors.lightPink.withOpacity(.5)),
                  border: InputBorder.none,
                ),
              ),
            ),
            Obx(() => searchBarController.isSearchBarEmpty.value
                ? const SizedBox()
                : IconButton(
                    onPressed: () {
                      homePageController.isSearchBarSelected.value = false;
                    },
                    icon: const Icon(Icons.close)))
          ],
        ),
      ),
    );
  }
}

class CustomSearchContainer extends StatelessWidget {
  CustomSearchContainer(
      {super.key, required this.sizePercent, required this.nextScreen,this.backgroundColor});
  final String nextScreen;
  final double sizePercent;
  final HomePageController homePageController = Get.put(HomePageController());
  final SearchPageController searchPageController =
      Get.put(SearchPageController()); 
  Color? backgroundColor = CustomColors.lila.withOpacity(.1);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(nextScreen, id: NavigationKey.home.index,);
        print(nextScreen);

      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        width: ResponsiveMesurement.asWidth(context, sizePercent),
        height: ResponsiveMesurement.asWidth(context, 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 5,
            ),
            Icon(Icons.search, color: CustomColors.lightPink.withOpacity(.7)),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                style: montserratMedium.copyWith(
                    color: CustomColors.lightPink.withOpacity(.5)),
                "Kuaför, hizmet ve stil ara...",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomSearchContainerWithSearchText extends StatelessWidget {
  CustomSearchContainerWithSearchText({
    super.key,
    required this.sizePercent,
    this.textEditingController,
  });
  TextEditingController? textEditingController;
  final double sizePercent;

  final HomePageController homePageController = Get.put(HomePageController());
  final SearchPageController searchPageController =
      Get.put(SearchPageController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/searchPage", id: NavigationKey.home.index);
      },
      child: Container(
        width: ResponsiveMesurement.asWidth(context, sizePercent),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomColors.lila.withOpacity(.1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                homePageController.isSearchBarSelected.value = true;
              },
              icon: Icon(Icons.search, color: CustomColors.lightPink),
            ),
            Obx(
              () => Expanded(
                child: TextField(
                  style: montserratMedium,
                  controller: textEditingController,
                  showCursor: false,
                  autofocus: false,
                  decoration: InputDecoration(
                    hintText: "Arama yapın",
                    hintStyle: montserratMedium.copyWith(
                        color: CustomColors.lightPink.withOpacity(.5)),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
