import 'package:hairdresser_project/models/barber.dart';
import 'package:hairdresser_project/models/category.dart';
import 'package:hairdresser_project/models/post_media.dart';

class Post {
  int id;
  Barber barber;
  String content;
  Category category;
  DateTime createdAt;
  DateTime updatedAt;
  List<PostMedia> postMediaList;

  Post({
    this.id = 0,
    this.postMediaList = const <PostMedia>[],
    required this.barber,
    required this.category,
    this.content = '',
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    // return Post(
    //     id: 1,
    //     barber: Barber(
    //         id: 1,
    //         user: User(
    //             id: 1,
    //             email: "email",
    //             phoneNumber: "phoneNumber",
    //             addresses: <Address>[Address(
    //                 id: 1,
    //                 district: District(
    //                     id: 1,
    //                     districtName: "districtName",
    //                     province: Province(
    //                         id: 1,
    //                         provinceName: "provinceName",
    //                         country: Country(
    //                             id: 1,
    //                             countryCode: 1,
    //                             countryName: "countryName"))),
    //                 addressType: 1,
    //                 buildingNo: "1",
    //                 street: "street",
    //                 region: "region",
    //                 postalCode: 1,
    //                 description: "description",
    //                 coordinate: "1",
    //                 userId: 1)]),
    //         identityNumber: "1",
    //         firstName: "firstName",
    //         lastName: "lastName",
    //         bio: "bio",
    //         email: "email",
    //         profileImage: "profileImage",
    //         identityCard: "identityCard",
    //         status: 1,
    //         shopName: "shopName",
    //         isImproved: true),
    //     category: Category(
    //         id: 1,
    //         categoryName: "categoryName",
    //         createdAt: "",
    //         categoryImage: "categoryImage"),
    //     content: "content",
    //     createdAt: DateTime.now(),
    //     updatedAt: DateTime.now());
    return Post(
      id: json['id'],
      postMediaList: json['post_medias'] != null ? (json['post_medias'] as List)
          .map((item) => PostMedia.fromJson(item))
          .toList() : [],
      barber: Barber.fromJson(json['barber']),
      category: Category.fromJson(json['category']),
      content: json['content'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hairdresser': barber.toJson(),
      'content': content,
      'category': category.toJson(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'post_medias': postMediaList.map((media) => media.toJson()).toList(),
    };
  }
}