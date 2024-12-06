import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hairdresser_project/models/category.dart';
import 'package:hairdresser_project/modules/category/widgets/home_page_category_card_view.dart';

class CategoryListWidget extends StatefulWidget {
  const CategoryListWidget({super.key});

  @override
  State<CategoryListWidget> createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  // List<Category> categoryList=[Category(
  //           categoryName: "Saç Bakımı",
  //           descriptions: "descriptions",
  //           createdAt: DateTime.now(),
  //           imageUrl:
  //               "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0"),
  //       Category(
  //           categoryName: "Cilt Bakımı",
  //           descriptions: "descriptions",
  //           createdAt: DateTime.now(),
  //           imageUrl:
  //               "https://images.unsplash.com/photo-1521747116042-5a810fda9664"),
  //       Category(
  //           categoryName: "Saç Kesimi",
  //           descriptions: "descriptions",
  //           createdAt: DateTime.now(),
  //           imageUrl:
  //               "https://images.unsplash.com/photo-1560807707-8cc77767d783"),

  //       Category(
  //           categoryName: "Makyaj",
  //           descriptions: "descriptions",
  //           createdAt: DateTime.now(),
  //           imageUrl:
  //               "https://static3.depositphotos.com/1005412/218/i/950/depositphotos_2186038-stock-photo-kitten-lays-isolated.jpg"),];

  List<Category> categoryList = [];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MasonryGridView.builder(
        itemCount: categoryList.length,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (contex, index) => HomePageCategoryCardView(
          category: categoryList[index],
        ),
      ),
    );
  }
}
