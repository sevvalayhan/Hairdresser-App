import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/controllers/home_page_controller.dart';
import 'package:hairdresser_project/static/custom_colors.dart';

// ignore: must_be_immutable
class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({
    super.key,
    required this.size,
  });

  final Size size;
  final TextEditingController controller = TextEditingController();
  final HomePageController homePageController = HomePageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          print("xxxxx");
        },
        child: Container(
          width: size.width * .95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: CustomColors.lightPink, width: .2),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  print("search button");
                  homePageController.isSearchBarSelected.value = true;
                  print(homePageController.isSearchBarSelected.value);
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black54.withOpacity(.6),
                ),
              ),
              Expanded(
                child: TextField(
                  style: montserratMedium,
                  controller: controller,
                  showCursor: false,
                  decoration: InputDecoration(
                    hintText: "Arama yapın",
                    hintStyle: montserratMedium.copyWith(color: Colors.black54),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Obx(
                () => homePageController.isSearchBarSelected.value
                    ? IconButton(
                        onPressed: () {
                          homePageController.isSearchBarSelected.value = false;
                          print(homePageController.isSearchBarSelected.value);
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
