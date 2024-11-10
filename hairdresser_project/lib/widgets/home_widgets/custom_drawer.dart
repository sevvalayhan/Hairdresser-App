import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/constants/dimensions.dart';
import 'package:hairdresser_project/constants/static/custom_colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
        child: Padding(
      padding: AppDimensions.pagePadding,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.close_rounded)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.cut_outlined))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hoş Geldin Şevval Ayhan!",
                      style: montserratMedium,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {},
                      leading: Icon(
                        Icons.home,
                        color: CustomColors.lightPink,
                      ),
                      title: const Text(
                        "Ana Sayfa",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {},
                      leading: Icon(
                        Icons.history,
                        color: CustomColors.lightPink,
                      ),
                      title: Text(
                        "Randevularım",
                        style: montserratMedium,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {},
                      leading: Icon(
                        Icons.cut,
                        color: CustomColors.lightPink,
                      ),
                      title: Text(
                        "Kuaförler",
                        style: montserratMedium,
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      onTap: () {},
                      leading: Icon(
                        Icons.favorite,
                        color: CustomColors.lightPink,
                      ),
                      title: Text(
                        "Favorilerim",
                        style: montserratMedium,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Text(
                        "Kuaförüm Uygulaması Hakkında",
                        style: montserratSmall.copyWith(
                            color: CustomColors.lightPink),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Text(
                        "Yardım & Destek",
                        style: montserratSmall.copyWith(
                            color: CustomColors.lightPink),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Text(
                        "KVKK Açık Rıza Metni",
                        style: montserratSmall.copyWith(
                            color: CustomColors.lightPink),
                      ),
                      onTap: () {},
                    ),
                    Text(
                      "v 1.0.0",
                      style: montserratSmall,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
