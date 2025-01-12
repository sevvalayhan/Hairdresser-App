import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/models/barber.dart';
import 'package:hairdresser_project/modules/barber/barber_details.dart/barber_details_home_module.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';
import 'package:hairdresser_project/widgets/home_widgets/custom_search_bar.dart';

// ignore: must_be_immutable
class BarberDetailsPage extends StatelessWidget {
  BarberDetailsPage({
    super.key,
  });
  Barber barber = Get.arguments;
  @override
  Widget build(BuildContext context) {
    List<Widget> tabList = [
      BarberDetailsHomeModule(
        barber: barber,
      ),
      const Center(
        child: Text("data"),
      ),
      const Center(
        child: Text("data"),
      )
    ];
    print(barber.shopName);
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        body: Column(children: [
          pageAppBar(context),
          tabBar(context),
          Expanded(child: TabBarView(children: tabList))
        ]),
      ),
    );
  }

  Widget tabBar(BuildContext context) {
    return SizedBox(
      height: ResponsiveMesurement.asHeight(context, 7),
      child: TabBar(
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: .2,
        indicatorPadding: const EdgeInsets.all(8),
        indicatorColor: CustomColors.lightPink,
        labelColor: CustomColors.black,
        unselectedLabelColor: CustomColors.black,
        splashBorderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        tabs: const [
          Tab(
            text: "Ana Sayfa",
          ),
          Tab(
            text: "Hizmetler",
          ),
          Tab(
            text: "Profil",
          )
        ],
      ),
    );
  }

  Container barberProfileImage(BuildContext context) {
    return Container(
      width: ResponsiveMesurement.asWidth(context, 10),
      height: ResponsiveMesurement.asWidth(context, 10),
      decoration: BoxDecoration(
          border: Border.all(
            color: CustomColors.grey.withOpacity(.4),
          ),
          borderRadius: BorderRadius.circular(50)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CustomImageFetcher(
          imageUrl: barber.profileImage,
        ),
      ),
    );
  }

  Widget pageAppBar(BuildContext context) {
    return SizedBox(
      height: ResponsiveMesurement.asHeight(context, 20),
      child: Stack(
        children: [
          CustomImageFetcher(
            imageUrl: barber.profileImage,
          ),
          Container(
            color: Colors.white.withOpacity(.80),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: CustomColors.lightPink,
              ),
            ),
            child: SizedBox(
              height: ResponsiveMesurement.asHeight(context, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  barberInformation(context),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      CustomSearchContainer(
                        nextScreen: "",
                        sizePercent: 80,
                        backgroundColor: CustomColors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      IconButton(
                          disabledColor: CustomColors.white,
                          color: CustomColors.white,
                          onPressed: () {},
                          icon: Icon(
                            Icons.file_upload_outlined,
                            color: CustomColors.lightPink,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget barberInformation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: () {
            //Get.toNamed(AppRoutes.home, id: NavigationKey.home.index);
            Get.back(); //bunu yaptığım zaman evet bir önceki sayfaya gidiyor ama search sayfası sıfırlanıyor
          },
          icon: Icon(
            size: 20,
            Icons.arrow_back_ios_new,
            color: CustomColors.lightPink,
          ),
        ),
        barberProfileImage(context),
        Text(
          barber.shopName,
          style: montserratLarge,
        ),
        followButtonContainer(context)
      ],
    );
  }

  Widget followingButtonContainer(BuildContext context) {
    return Container(
      width: ResponsiveMesurement.asWidth(context, 27),
      height: ResponsiveMesurement.asHeight(context, 3),
      decoration: BoxDecoration(
          color: CustomColors.white,
          border: Border.all(color: CustomColors.lightPink.withOpacity(.5)),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.check_circle,
            color: CustomColors.lightPink,
            size: 15,
          ),
          Text("Takip Ediliyor",
              style: montserratMedium.copyWith(
                  fontSize: ResponsiveMesurement.fontPercent(context, 3))),
        ],
      ),
    );
  }

  Widget followButtonContainer(BuildContext context) {
    return Container(
      width: ResponsiveMesurement.asWidth(context, 22),
      height: ResponsiveMesurement.asHeight(context, 3),
      decoration: BoxDecoration(
          border: Border.all(color: CustomColors.lightPink.withOpacity(.5)),
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Takip Et",
              style: montserratMedium.copyWith(
                  fontSize: ResponsiveMesurement.fontPercent(context, 3))),
        ],
      ),
    );
  }
}
