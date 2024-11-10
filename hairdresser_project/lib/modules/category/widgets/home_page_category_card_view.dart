import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hairdresser_project/constants/custom_text.dart';
import 'package:hairdresser_project/models/category.dart';

class HomePageCategoryCardView extends StatelessWidget {
  const HomePageCategoryCardView({
    super.key,
    required this.category,
  });
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Stack(
         children: [
          Center(
            child: Container(
             clipBehavior: Clip. antiAlias,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: CachedNetworkImage(
              imageUrl: category.imageUrl,
            ),
            ),
          ),
          Positioned(left: 20,bottom: 20,child: Text(category.categoryName,style: montserratSemiBold.copyWith(color: Colors.white),))
        ],
      ),
    );
  }
}