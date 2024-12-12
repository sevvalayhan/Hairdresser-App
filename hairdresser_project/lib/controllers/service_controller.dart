import 'package:get/get.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/repositories/service_repository.dart';

class ServiceController extends GetxController {
  var serviceList = <Service>[].obs;
  var searchServiceList = <Service>[].obs;
 

  @override
  void onReady() async {
    await fetchAllService();
  }

  final ServiceRepository serviceRepository = ServiceRepository();

  Future<void> fetchAllService() async {
    try {
      var fetchedService = await serviceRepository.fetchAllServices();
      if (fetchedService != null) {
        serviceList.assignAll(fetchedService);
      } else {
        throw Exception("Service data is null");
      }
    } catch (e) {
      throw Exception("Failed to fetch service: $e");
    }
  }

  Future<void> fetchSearchServices(String searchText) async {
    try {
      var serviceData = await serviceRepository.fetchSearchServices(searchText);
      if (serviceData != null) {
        searchServiceList.assignAll(serviceData);
      } else {
        throw Exception("Service data is null");
      }
    } catch (e) {
      throw Exception("Failed to fetch service: $e");
    }
  }

  // Future<void> addService(Service service) async {
  //   try {
  //     var newService = await serviceRepository.addService(service);
  //     if (newService != null) {
  //       serviceList.add(newService);
  //     }
  //   } catch (e) {
  //     print("hata");
  //   }
  // }

  // Future<void> updateService(int postId, Service updateService) async {
  //   try {
  //     var updated =
  //         await serviceRepository.updateService(postId, updateService);
  //     if (updated != null) {
  //       int index = serviceList.indexWhere((post) => post.id == postId);
  //       if (index != -1) {
  //         serviceList[index] = updated;
  //       }
  //     }
  //   } catch (e) {
  //     //Get.snackbar('Error', 'Could not update post: $e');
  //   }
  // }

  Future<void> deletePost(int postId) async {
    try {
      var result = await serviceRepository.deleteService(postId);
      if (result) {
        serviceList.removeWhere((post) => post.id == postId);
      }
    } catch (e) {
      //Get.snackbar('Error', 'Could not delete post: $e');
    }
  }
}
