import 'package:flutter/material.dart';
import 'package:hairdresser_project/models/address.dart';
import 'package:hairdresser_project/models/barber.dart';
import 'package:hairdresser_project/models/country.dart';
import 'package:hairdresser_project/models/district.dart';
import 'package:hairdresser_project/models/province.dart';
import 'package:hairdresser_project/models/user.dart';
import 'package:hairdresser_project/modules/barber/widgets/barber_homepage_profile_card.dart';

// ignore: must_be_immutable
class BarberProfileList extends StatelessWidget {
  BarberProfileList({super.key});

  List<Barber> barberList = [
    Barber(
        user: User(
            address: Address(
                addressType: 1,
                buildingNo: "123",
                street: "Başağaç",
                region: "region",
                postalCode: 06730,
                country: Country(
                    countryCode: 1,
                    countryName: "Türkiye",
                    province: Province(
                        provinceName: "Ankara",
                        district: District(districtName: "Beypazarı"))),
                description: "Okulun karşısı",
                coordinate: "coordinate"),
            userName: "userName",
            password: "password",
            permission: "permission",
            lastLogin: DateTime.now(),
            lastLogout: DateTime.now(),
            ipAddress: "ipAddress"),
        barberName: "Sevval",
        barberSurname: "Ayhan",
        bio: "bio",
        email: "email",
        profileImageUrl: "assets/images/sun.jpg",
        identityCard: "identityCard"),
    Barber(
        user: User(
            address: Address(
                addressType: 1,
                buildingNo: "123",
                street: "Başağaç",
                region: "region",
                postalCode: 06730,
                country: Country(
                    countryCode: 1,
                    countryName: "Türkiye",
                    province: Province(
                        provinceName: "Ankara",
                        district: District(districtName: "Beypazarı"))),
                description: "Okulun karşısı",
                coordinate: "coordinate"),
            userName: "userName",
            password: "password",
            permission: "permission",
            lastLogin: DateTime.now(),
            lastLogout: DateTime.now(),
            ipAddress: "ipAddress"),
        barberName: "Zülal",
        barberSurname: "Ayhan",
        bio: "bio",
        email: "email",
        profileImageUrl: "assets/images/sun.jpg",
        identityCard: "identityCard"),
    Barber(
        user: User(
            address: Address(
                addressType: 1,
                buildingNo: "123",
                street: "Başağaç",
                region: "region",
                postalCode: 06730,
                country: Country(
                    countryCode: 1,
                    countryName: "Türkiye",
                    province: Province(
                        provinceName: "Ankara",
                        district: District(districtName: "Beypazarı"))),
                description: "Okulun karşısı",
                coordinate: "coordinate"),
            userName: "userName",
            password: "password",
            permission: "permission",
            lastLogin: DateTime.now(),
            lastLogout: DateTime.now(),
            ipAddress: "ipAddress"),
        barberName: "Ali",
        barberSurname: "Ayhan",
        bio: "bio",
        email: "email",
        profileImageUrl: "assets/images/sun.jpg",
        identityCard: "identityCard"),
    Barber(
        user: User(
            address: Address(
                addressType: 1,
                buildingNo: "123",
                street: "Başağaç",
                region: "region",
                postalCode: 06730,
                country: Country(
                    countryCode: 1,
                    countryName: "Türkiye",
                    province: Province(
                        provinceName: "Ankara",
                        district: District(districtName: "Beypazarı"))),
                description: "Okulun karşısı",
                coordinate: "coordinate"),
            userName: "userName",
            password: "password",
            permission: "permission",
            lastLogin: DateTime.now(),
            lastLogout: DateTime.now(),
            ipAddress: "ipAddress"),
        barberName: "Yasemin",
        barberSurname: "Ayhan",
        bio: "bio",
        email: "email",
        profileImageUrl: "assets/images/sun.jpg",
        identityCard: "identityCard"),
    Barber(
        user: User(
            address: Address(
                addressType: 1,
                buildingNo: "123",
                street: "Başağaç",
                region: "region",
                postalCode: 06730,
                country: Country(
                    countryCode: 1,
                    countryName: "Türkiye",
                    province: Province(
                        provinceName: "Ankara",
                        district: District(districtName: "Beypazarı"))),
                description: "Okulun karşısı",
                coordinate: "coordinate"),
            userName: "userName",
            password: "password",
            permission: "permission",
            lastLogin: DateTime.now(),
            lastLogout: DateTime.now(),
            ipAddress: "ipAddress"),
        barberName: "Erol",
        barberSurname: "Ayhan",
        bio: "bio",
        email: "email",
        profileImageUrl: "assets/images/sun.jpg",
        identityCard: "identityCard"),
  ];

  @override
  Widget build(BuildContext context) {
    double horizontalSize = MediaQuery.sizeOf(context).height;
    double verticalSize = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: verticalSize * .30,
      width: horizontalSize,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: barberList.length,
        itemBuilder: (context, index) => BarberHomepageProfileCard(
          barber: barberList[index],
        ),
      ),
    );
  }
}
