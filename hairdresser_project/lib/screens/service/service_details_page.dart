import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';
import 'package:hairdresser_project/controllers/home_page_controller.dart';
import 'package:hairdresser_project/controllers/search_page_controller.dart';
import 'package:hairdresser_project/controllers/service_detail_controller.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/modules/service/base_services/widgets/service_image_widget.dart';
import 'package:hairdresser_project/navigation/navigation_key.dart';
import 'package:hairdresser_project/routes/app_pages.dart';
import 'package:hairdresser_project/utils/responsive_mesurement.dart';
import 'package:hairdresser_project/widgets/appointment_button.dart';
import 'package:hairdresser_project/widgets/barber_profil_image_widget.dart';
import 'package:hairdresser_project/widgets/filter_icon_button.dart';
import 'package:hairdresser_project/widgets/home_widgets/custom_search_bar.dart';

// ignore: must_be_immutable
class ServiceDetail extends StatelessWidget {
  ServiceDetail({
    super.key,
  });
  Service service = Get.arguments;
  ServiceDetailController serviceDetailController =
      Get.put(ServiceDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  pageAppBar(AppRoutes.searchPage, NavigationKey.home.index),
                  serviceImage(
                      context, service), //service.serviceImages[0].image)),
                  serviceBody(context),
                  barberInformation(context), //go to barber details page
                  // Divider(
                  // thickness: .2,
                  //   color: CustomColors.grey,
                  // ),
                  serviceDetailsText(),
                ],
              ),
              //   Column(
              //     children: [
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             "Benzer Stiller",
              //             style: montserratBold,
              //           ),
              //           Container(
              //             width: ResponsiveMesurement.asWidth(context, 98),
              //             height: ResponsiveMesurement.asHeight(context, 25),
              //             decoration: BoxDecoration(
              //               color: Colors.transparent,
              //               border: Border.all(
              //                   color: CustomColors.lightPink.withOpacity(.5),
              //                   width: .5),
              //             ),
              //             child: ListView.builder(
              //               scrollDirection: Axis.horizontal,
              //               itemCount: 10,
              //               itemBuilder: (context, index) =>
              //                   Center(child: Text(index.toString())),
              //             ),
              //           )
              //         ],
              //       )
              //     ],
              //   )
            ],
          ),
        ),
      ]),
      bottomNavigationBar: appointmentButtonContainer(context),
    );
  }

  Padding serviceBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
      child: SizedBox(
        height: ResponsiveMesurement.asHeight(context, 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              service.title,
              style: montserratLarge.copyWith(color: CustomColors.black),
            ),
            Text(
              "${service.price} TL | ${service.duration} dk",
              style: montserratMedium.copyWith(color: CustomColors.lightPink),
            ),
            userSatisfaction(),
            barberAdress(context)
          ],
        ),
      ),
    );
  }

  Padding pageAppBar(String url, int navigationKey) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
               //Get.toNamed(url, );
              Get.back(); //bunu yaptığım zaman evet bir önceki sayfaya gidiyor ama search sayfası sıfırlanıyor
            },
            icon: Icon(
              size: 20,
              Icons.arrow_back_ios_new,
              color: CustomColors.lightPink,
            ),
          ),
          const CustomSearchContainer(
              sizePercent: 70, ),
          const FilterIconButton(),
        ],
      ),
    );
  }

  Container appointmentButtonContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ResponsiveMesurement.asHeight(context, 8),
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(
                  color: CustomColors.grey.withOpacity(.4), width: .4))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Bugün için son bir kişi ! ",
              style: montserratMedium.copyWith(
                  color: CustomColors.lightPink, fontWeight: FontWeight.w300),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: AppointmentButton(),
          )
        ],
      ),
    );
  }

  Column serviceDetailsText() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Hizmet Detayları",
                style: montserratLarge,
              ),
              Text(
                service.description,
                style: montserratMedium,
              )
            ],
          ),
        ),
      ],
    );
  }

  Container barberInformation(BuildContext context) {
    return Container(
        width: double.infinity,
        height: ResponsiveMesurement.asHeight(context, 8),
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(
                    color: CustomColors.grey.withOpacity(.5), width: .4))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BarberProfilImageWidget(
                      imageUrl: service.barber.profileImage,
                      circleDiameter: ResponsiveMesurement.asWidth(context, 10),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          service.barber.shopName,
                          style: montserratBold.copyWith(
                              color: CustomColors.black),
                        ),
                        Text(
                          "10,5 B Takipçi",
                          style: montserratSmallThin,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget barberAdress(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  ImageIcon(
                    const AssetImage("assets/icon_image/placemarker.png"),
                    color: CustomColors.lightPink,
                  ),
                  Text("Konumu Gör",
                      style: montserratSmall.copyWith(
                        color: CustomColors.lightPink,
                      ))
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: ResponsiveMesurement.asWidth(context, 70),
                child: Text(
                  "  ${service.barber.user.addresses[0].district.province.provinceName}, ${service.barber.user.addresses[0].district.districtName},${service.barber.user.addresses[0].region}, ${service.barber.user.addresses[0].street}, no : ${service.barber.user.addresses[0].buildingNo} ",
                  style: montserratSmallBold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget userSatisfaction() {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "4.1",
                style: montserratMedium.copyWith(color: CustomColors.black),
              ),
              const SizedBox(
                width: 10,
              ),
              stars(),
              const SizedBox(
                width: 15,
              ),
              Text(
                "|   105 değerlendirme",
                style: montserratSmall,
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.chevron_right,
                size: 15,
                color: CustomColors.black,
              )
            ],
          ),
        ),
      ],
    );
  }

  Container serviceImage(BuildContext context, Service service) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
              color: CustomColors.lightPink.withOpacity(.7), width: .5),
        ),
        width: double.infinity,
        height: ResponsiveMesurement.asHeight(context, 40),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
            child: ServiceImageWidget(sizePercent: 40, service: service)));
  }

  Row stars() {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: CustomColors.goldenYellow,
          size: 15,
        ),
        Icon(Icons.star, color: CustomColors.goldenYellow, size: 15),
        Icon(Icons.star, color: CustomColors.goldenYellow, size: 15),
        Icon(Icons.star, color: CustomColors.goldenYellow, size: 15),
        Icon(Icons.star,
            color: CustomColors.goldenYellow.withOpacity(.5), size: 15),
      ],
    );
  }
}
class CustomSearchContainer extends StatelessWidget {
  const CustomSearchContainer(
      {super.key, required this.sizePercent, });
 
  final double sizePercent;
 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.searchPage,id:NavigationKey.home.index); 

      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        width: ResponsiveMesurement.asWidth(context, sizePercent),
        height: ResponsiveMesurement.asWidth(context, 11),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: CustomColors.lila.withOpacity(.1),
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