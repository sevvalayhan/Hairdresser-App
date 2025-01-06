import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/controllers/service_controller.dart';
import 'package:hairdresser_project/modules/search/search_result/service_result/widgets/search_service_result_card.dart';
import 'package:hairdresser_project/navigation/navigation_key.dart';
import 'package:hairdresser_project/routes/app_pages.dart';
import 'package:hairdresser_project/widgets/filter_icon_button.dart';
import 'package:hairdresser_project/widgets/home_widgets/custom_search_bar.dart';
import 'package:hairdresser_project/widgets/list_empty_widget.dart';

// ignore: must_be_immutable
class NearbyServicesListPage extends StatelessWidget {
  NearbyServicesListPage({super.key});
  ServiceController serviceController = Get.put(ServiceController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
                children: [
          pageAppBar(),
          Expanded(
            child: serviceController.serviceList.isNotEmpty
                ? GridView.builder(
                    itemCount: serviceController.serviceList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: .55),
                    itemBuilder: (BuildContext context, int index) {
                      return SearchServiceResultCard(
                        service: serviceController.serviceList[index],
                      );
                    })
                : const ListEmptyWidget(),
          ),
                ],
              ),
        ));
  }

  Padding pageAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
             Get.toNamed(AppRoutes.home, id: NavigationKey.home.index);
            //  Get.back(); //bunu yaptığım zaman evet bir önceki sayfaya gidiyor ama search sayfası sıfırlanıyor
            },
            icon: Icon(
              size: 20,
              Icons.arrow_back_ios_new,
              color: CustomColors.lightPink,
            ),
          ),
          CustomSearchContainer(
              sizePercent: 70, nextScreen: AppRoutes.searchPage),
          const FilterIconButton(),
        ],
      ),
    );
  }
}
