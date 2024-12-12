import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/controllers/home_page_controller.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/controllers/search_page_controller.dart';
import 'package:hairdresser_project/controllers/service_controller.dart';
import 'package:hairdresser_project/navigation/navigation_key.dart';

// ignore: must_be_immutable
class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({
    super.key,
  });

  final SearchPageController searchBarController =
      Get.put(SearchPageController());
  final ServiceController serviceController = Get.put(ServiceController());
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            color: CustomColors.lila.withOpacity(.1),
            borderRadius: BorderRadius.circular(10),
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
                    onChanged: (value) {
                      searchBarController.checkIfTextFieldIsEmpty();
                      searchBarController.updateSearchServiceList();
                    },
                    style: montserratMedium,
                    controller: searchBarController.textController.value,
                    showCursor: true,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Arama yapın",
                      hintStyle: montserratMedium.copyWith(
                          color: CustomColors.lightPink.withOpacity(.5)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Obx(
                () => homePageController.isSearchBarSelected.value
                    ? IconButton(
                        onPressed: () {
                          homePageController.isSearchBarSelected.value = false;
                        },
                        icon: const Icon(Icons.close))
                    : const SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSearchContainer extends StatelessWidget {
  CustomSearchContainer({
    super.key,
    required this.size,
  });

  final Size size;
  final HomePageController homePageController = HomePageController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed("/searchPage", id: NavigationKey.home.index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          width: size.width * .95,
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
              Expanded(
                child: Text(
                  "Arama yapın",
                  style: montserratMedium.copyWith(
                      color: CustomColors.lightPink.withOpacity(.6)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
