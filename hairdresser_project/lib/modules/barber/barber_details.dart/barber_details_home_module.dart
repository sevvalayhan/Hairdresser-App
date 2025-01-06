import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';
import 'package:hairdresser_project/widgets/custom_image_fetcher.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class BarberDetailsHomeModule extends StatelessWidget {
  BarberDetailsHomeModule({super.key});
  List<PageViewListImage> pageViewList = [
    PageViewListImage(
        imageUrl: "assets/images/boy.jpg", title: "Dore Güzellik Salonu"),
    PageViewListImage(
        imageUrl: "assets/images/boy.jpg", title: "Dore Güzellik Salonu"),
    PageViewListImage(
        imageUrl: "assets/images/boy.jpg", title: "Dore Güzellik Salonu"),
  ];
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        pageViewList.isNotEmpty
            ? Center(
                child: SizedBox(
                  width: ResponsiveMesurement.asWidth(context, 90),
                  height: ResponsiveMesurement.asHeight(context, 25),
                  child: Center(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: pageViewList.length,
                      itemBuilder: (context, index) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(pageViewList[index].title,
                              style: montserratLarge),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: CustomColors.lightGreen
                                        .withOpacity(.3))),
                            width:
                                ResponsiveMesurement.asWidth(context, 85),
                            height:
                                ResponsiveMesurement.asHeight(context, 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: CustomImageFetcher(
                                  imageUrl: pageViewList[index].imageUrl),
                            ),
                          ),
                          Center(
                            child: SmoothPageIndicator(
                                        effect: const ScrollingDotsEffect(
                                            dotHeight: 8.0, dotWidth: 8.0),
                                        controller: pageController,
                                        count: pageViewList.length),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox()
      ],
    );
  }
}

class PageViewListImage {
  PageViewListImage({required this.title, required this.imageUrl});
  final String title;
  final String imageUrl;
}
