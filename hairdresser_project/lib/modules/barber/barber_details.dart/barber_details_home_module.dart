import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/controllers/post_controller.dart';
import 'package:hairdresser_project/models/barber.dart';
import 'package:hairdresser_project/models/category.dart';
import 'package:hairdresser_project/models/post.dart';
import 'package:hairdresser_project/models/post_media.dart';
import 'package:hairdresser_project/models/user.dart';
import 'package:hairdresser_project/modules/post/widgets/post_card_for_barber_profile.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';
import 'package:hairdresser_project/widgets/appointment_button.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class BarberDetailsHomeModule extends StatelessWidget {
  final Barber barber;

  BarberDetailsHomeModule({super.key, required this.barber}) {
    pageViewList = [
      PageViewListImage(imageUrl: barber.profileImage, title: barber.shopName),
    ];
    for (var category in barber.categories) {
      pageViewList.add(
        PageViewListImage(
          imageUrl: category.categoryImage,
          title: category.categoryName,
        ),
      );
    }
  } 
  late List<PageViewListImage> pageViewList;
  PageController pageController = PageController(); 
  Post post = Post(
      content:
          "Bir berber bir berbere gel beraber berber dükkanı açalım demiş, Bir berber bir berbere gel beraber berber dükkanı açalım demiş, Bir berber bir berbere gel beraber berber dükkanı açalım demiş",
      postMediaList: [
        PostMedia(
            id: 1,
            mediaType: MediaType.image,
            mediaUrl: "assets/images/boy.jpg")
      ],
      barber: Barber(
          shopName: "Dore Güzellik Salonu",
          profileImage: "assets/images/boy.jpg",
          user: User(id: 1, email: "email", phoneNumber: "", addresses: [])),
      category: Category(
          id: 1,
          categoryName: "categoryName",
          createdAt: "createdAt",
          categoryImage: "categoryImage"),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          imagePageView(context),
          const SizedBox(
            height: 15,
          ),
          adress(context),
          const SizedBox(
            height: 15,
          ),
          barberInformationWithApointmentButton(context),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                border:
                    Border.all(color: CustomColors.lightPink.withOpacity(.5)),
                borderRadius: BorderRadius.circular(5)),
            height: ResponsiveMesurement.asHeight(context, 55),
            width: ResponsiveMesurement.asWidth(context, 95),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gönderiler",
                        style: montserratLargeBold,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                "Hepsini Göster",
                                style: montserratSmall.copyWith(
                                    color: CustomColors.lightPink),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.chevron_right_sharp,
                                color: CustomColors.lightPink,
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: ResponsiveMesurement.asHeight(context, 45),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) =>
                          PostCardForBarberProfile(post: post),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container barberInformationWithApointmentButton(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
          border: Border.all(
            color: CustomColors.lightPink.withOpacity(.1),
          )),
      height: ResponsiveMesurement.asHeight(context, 15),
      width: ResponsiveMesurement.asWidth(context, 95),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 10,
                ),
                barberProfileImage(context, 10),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: ResponsiveMesurement.asWidth(context, 65),
                      child: Text(
                        barber.shopName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: montserratLargeBold,
                      ),
                    ),
                    Text(
                      "10,1 B Takipçi",
                      style: montserratSmall,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [AppointmentButton()],
            )
          ],
        ),
      ),
    );
  }

  Container barberProfileImage(BuildContext context, double percent) {
    return Container(
      width: ResponsiveMesurement.asWidth(context, percent),
      height: ResponsiveMesurement.asWidth(context, percent),
      decoration: BoxDecoration(
          border: Border.all(
            color: CustomColors.grey.withOpacity(.4),
          ),
          borderRadius: BorderRadius.circular(50)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: CustomImageFetcher(
          imageUrl: barber.profileImage,
          // imageUrl: "assets/images/boy.jpg",
        ),
      ),
    );
  }

  SizedBox adress(BuildContext context) {
    return SizedBox(
      width: ResponsiveMesurement.asWidth(context, 95),
      height: ResponsiveMesurement.asHeight(context, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          cityNameContainer(context),
          Row(
            children: [
              pinIcon(),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                  width: ResponsiveMesurement.asWidth(context, 55),
                  child: Text(
                    "${barber.user.addresses[0].region}, ${barber.user.addresses[0].district.districtName}, ${barber.user.addresses[0].district.province.provinceName}",
                    style: montserratLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Flexible cityNameContainer(BuildContext context) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: CustomColors.lightPink.withOpacity(.5)),
            color: CustomColors.white,
            borderRadius: BorderRadius.circular(5)),
        height: ResponsiveMesurement.asHeight(context, 3.5),
        width: ResponsiveMesurement.asWidth(context, 35),
        child: Center(
          child: Text(
            barber.user.addresses[0].district.province.provinceName,
            style: montserratMedium.copyWith(
              color: CustomColors.lightPink,
            ),
          ),
        ),
      ),
    );
  }

  Column pinIcon() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ImageIcon(
          const AssetImage("assets/icon_image/placemarker.png"),
          color: CustomColors.lightPink,
          size: 30,
        ),
        Text(
          "Konumu Haritada Gör",
          style: montserratSmall.copyWith(color: CustomColors.lightPink),
        )
      ],
    );
  }

  Column imagePageView(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: ResponsiveMesurement.asWidth(context, 90),
          height: ResponsiveMesurement.asHeight(context, 25),
          child: PageView.builder(
            controller: pageController,
            itemCount: pageViewList.length,
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pageViewList[index].title, style: montserratLarge),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: CustomColors.lightPink.withOpacity(.2))),
                  width: ResponsiveMesurement.asWidth(context, 85),
                  height: ResponsiveMesurement.asHeight(context, 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CustomImageFetcher(
                        imageUrl: pageViewList[index].imageUrl),
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: SmoothPageIndicator(
              effect: JumpingDotEffect(
                  activeDotColor: CustomColors.lightPink,
                  dotHeight: 8.0,
                  dotWidth: 8.0),
              controller: pageController,
              count: pageViewList.length),
        )
      ],
    );
  }
}

class PageViewListImage {
  PageViewListImage({required this.title, required this.imageUrl});
  final String title;
  final String imageUrl;
}
