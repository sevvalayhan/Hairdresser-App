import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/controllers/search_page_controller.dart';
import 'package:hairdresser_project/modules/search/search_page/search_page_module.dart';
import 'package:hairdresser_project/navigation/navigation_key.dart';
import 'package:hairdresser_project/widgets/back_page_button.dart';
import 'package:hairdresser_project/widgets/home_widgets/custom_search_bar.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  SearchPageController searchPageController = Get.put(SearchPageController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BackPageButton(
                      route: '/homePage',
                      navigationKey: NavigationKey.home.index),
                  CustomSearchBar(),
                ],
              ),
            ),
            searchPageController.isSearchBarEmpty.value
                ? Column(
                    children: [
                      searchPageController.searchHistoryList.isNotEmpty
                          ? cleanHistoryButton()
                          : const SizedBox(),
                      searchHistoryListElements()
                    ],
                  )
                : SearchPageModule()
          ],
        ),
      ),
    );
  }

  Padding cleanHistoryButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Geçmiş Aramalarım"),
          TextButton(
            onPressed: () {
              searchPageController.cleanSearchHistoryList();
            },
            child: Text(
              "Temizle",
              style: montserratBold.copyWith(color: CustomColors.lightPink),
            ),
          )
        ],
      ),
    );
  }

  Column searchHistoryListElements() {
    int listLenght = searchPageController.searchHistoryList.length;
    bool showMore = searchPageController.showMore.value;
    listLenght = showMore ? listLenght : (listLenght > 5 ? 5 : listLenght);
    return Column(
      children: [
        Column(
          children: List.generate(listLenght, (index) {
            return Column(
              children: [
                InkWell(
                  highlightColor: CustomColors.lightPink.withOpacity(.2),
                  splashColor: CustomColors.lightPink.withOpacity(.2),
                  onTap: () {},
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.search_rounded,
                              color: CustomColors.lightPink.withOpacity(.7),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(searchPageController.searchHistoryList[index]),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              searchPageController
                                  .deleteElementFromSearchHistoryList(index);
                            },
                            icon: Icon(
                              Icons.close,
                              color: CustomColors.black.withOpacity(.6),
                            )),
                      ],
                    ),
                  ),
                ),
                Divider(
                  indent: 5,
                  endIndent: 5,
                  height: 1,
                  color: CustomColors.grey,
                ),
              ],
            );
          }),
        ),
        searchPageController.searchHistoryList.length > 5
            ? seeDetailHistoryButton()
            : const SizedBox(),
      ],
    );
  }

  SizedBox seeDetailHistoryButton() {
    return SizedBox(
        child: Center(
            child: TextButton(
      onPressed: () {
        searchPageController.showMore.value =
            !searchPageController.showMore.value;
      },
      child: Text(
          searchPageController.showMore.value
              ? "Daha az göster"
              : "Daha fazla göster",
          style: montserratBold.copyWith(
            color: CustomColors.lightPink,
          )),
    )));
  }
}
