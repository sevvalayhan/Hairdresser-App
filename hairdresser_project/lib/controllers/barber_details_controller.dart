import 'dart:async'; 
import 'package:get/get.dart';

class BarberDetailsController extends GetxController {
  var currentPageIndex = 0.obs;
  var pageLenght= 1.obs;
@override
  void update([List<Object>? ids, bool condition = true]) {
    changeCurrentPage();
    super.update(ids, condition);
  }
  void changeCurrentPage() {
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentPageIndex.value < pageLenght.value) {
        currentPageIndex.value++;       
      } else {
        currentPageIndex.value = 0;
      }
    });
  }
}
