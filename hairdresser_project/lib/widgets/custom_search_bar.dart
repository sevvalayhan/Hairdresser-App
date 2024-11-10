import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/controllers/home_page_controller.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';

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
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          print("xxxxx");
        },
        child: Container(
          width: size.width * .95,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: CustomColors.lightPink, width:1),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  homePageController.isSearchBarSelected.value = true;
                },
                icon: Icon(
                  Icons.search,
                  color:CustomColors.lightPink// const Color.fromARGB(137, 0, 0, 0).withOpacity(.6),                  
                ),
              ),
              Expanded(
                child: TextField(
                  style: montserratMedium,
                  controller: controller,
                  showCursor: false,
                  decoration: InputDecoration(
                    hintText: "Arama yapın",
                    hintStyle: montserratMedium.copyWith(color:CustomColors.lightPink),
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
