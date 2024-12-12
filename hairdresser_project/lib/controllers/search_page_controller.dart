import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hairdresser_project/controllers/barber_controller.dart';
import 'package:hairdresser_project/controllers/service_controller.dart';

class SearchPageController extends GetxController {
  var searchHistoryList = <String>[
    "Telefon",
    "Tablet",
    "Bilgisayar",
    "Kedi",
    "Kurabiye",
    "Kek",
    "Limonata",
    "Çay",
    "Makarna",
    "Börek",
    "Ayran",
    "Dürüm",
    "Çay",
  ].obs;

  ServiceController serviceController = Get.put(ServiceController());
  BarberController barberController = Get.put(BarberController());
  var textController = TextEditingController().obs;
  Rx<bool> isSearchBarEmpty = true.obs;
  Rx<bool> showMore = false.obs;

  void checkIfTextFieldIsEmpty() {
    if (textController.value.text.isEmpty) {
      isSearchBarEmpty.value = true;
    } else {
      isSearchBarEmpty.value = false;
    }
  }

  void deleteElementFromSearchHistoryList(int index) {
    searchHistoryList.removeAt(index);
  }

  void cleanSearchHistoryList() {
    searchHistoryList.assignAll(<String>[]);
  }

  void updateSearchServiceList() {
    String query = cleanSearchQuery(textController.value.text);
    if (query.isNotEmpty) {
      serviceController.fetchSearchServices(query);
      barberController.fetchSearchBarbers(query);
    }
  }

  String cleanSearchQuery(String query) {
    return query.trim().replaceAll(RegExp(r'\s+'), ' ');
  }
}
