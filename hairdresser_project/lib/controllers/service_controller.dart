import 'package:get/get.dart';
import 'package:hairdresser_project/models/service.dart';
import 'package:hairdresser_project/repositories/service_repository.dart';

class ServiceController extends GetxController {
  final _serviceList = <Service>[].obs;
  final _filteredServiceList = <Service>[].obs;
  // final List<Service> services = [
  //   Service(
  //       id: 1,
  //       serviceTitle: "Kısa Saç Kesimi",
  //       barber: Barber(
  //           user: User(
  //               address: Address(
  //                   addressType: 1,
  //                   buildingNo: "123",
  //                   street: "Başağaç",
  //                   region: "region",
  //                   postalCode: 06730,
  //                   country: Country(
  //                       countryCode: 1,
  //                       countryName: "Türkiye",
  //                       province: Province(
  //                           provinceName: "Ankara",
  //                           district: District(districtName: "Beypazarı"))),
  //                   description: "Okulun karşısı",
  //                   coordinate: "coordinate"),
  //               userName: "şevval",
  //               password: "123456",
  //               permission: "permission",
  //               lastLogin: DateTime.now(),
  //               lastLogout: DateTime.now(),
  //               ipAddress: "123123"),
  //           barberName: "Şevval",
  //           barberSurname: "Şevval",
  //           bio: "bio",
  //           email: "email@gmail.com",
  //           profileImageUrl: "profileImageUrl",
  //           identityCard: "identityCard"),
  //       category: Category(
  //           categoryName: "Cilt Bakımı",
  //           descriptions: "descriptions",
  //           createdAt: DateTime.now(),
  //           imageUrl: "imageUrl"),
  //       description: "description",
  //       price: 1,
  //       duration: DateTime.now(),
  //       serviceImage: ServiceImage(
  //           imageUrl:
  //               "https://im.haberturk.com/2018/11/08/2211673_b9bb20aeb3572f4e094f6490c276cdb1_640x640.jpg")),
  //   Service(
  //       id: 1,
  //       serviceTitle: "Kısa Saç Kesimi",
  //       barber: Barber(
  //           user: User(
  //               address: Address(
  //                   addressType: 1,
  //                   buildingNo: "123",
  //                   street: "Başağaç",
  //                   region: "region",
  //                   postalCode: 06730,
  //                   country: Country(
  //                       countryCode: 1,
  //                       countryName: "Türkiye",
  //                       province: Province(
  //                           provinceName: "Ankara",
  //                           district: District(districtName: "Beypazarı"))),
  //                   description: "Okulun karşısı",
  //                   coordinate: "coordinate"),
  //               userName: "şevval",
  //               password: "123456",
  //               permission: "permission",
  //               lastLogin: DateTime.now(),
  //               lastLogout: DateTime.now(),
  //               ipAddress: "123123"),
  //           barberName: "Şevval",
  //           barberSurname: "Şevval",
  //           bio: "bio",
  //           email: "email@gmail.com",
  //           profileImageUrl: "profileImageUrl",
  //           identityCard: "identityCard"),
  //       category: Category(
  //           categoryName: "Cilt Bakımı",
  //           descriptions: "descriptions",
  //           createdAt: DateTime.now(),
  //           imageUrl: "imageUrl"),
  //       description: "description",
  //       price: 1,
  //       duration: DateTime.now(),
  //       serviceImage: ServiceImage(
  //           imageUrl:
  //               "https://im.haberturk.com/2018/11/08/2211673_b9bb20aeb3572f4e094f6490c276cdb1_640x640.jpg")),
  //   Service(
  //       id: 1,
  //       serviceTitle: "Kısa Saç Kesimi",
  //       barber: Barber(
  //           user: User(
  //               address: Address(
  //                   addressType: 1,
  //                   buildingNo: "123",
  //                   street: "Başağaç",
  //                   region: "region",
  //                   postalCode: 06730,
  //                   country: Country(
  //                       countryCode: 1,
  //                       countryName: "Türkiye",
  //                       province: Province(
  //                           provinceName: "Ankara",
  //                           district: District(districtName: "Beypazarı"))),
  //                   description: "Okulun karşısı",
  //                   coordinate: "coordinate"),
  //               userName: "şevval",
  //               password: "123456",
  //               permission: "permission",
  //               lastLogin: DateTime.now(),
  //               lastLogout: DateTime.now(),
  //               ipAddress: "123123"),
  //           barberName: "Şevval",
  //           barberSurname: "Şevval",
  //           bio: "bio",
  //           email: "email@gmail.com",
  //           profileImageUrl: "profileImageUrl",
  //           identityCard: "identityCard"),
  //       category: Category(
  //           categoryName: "Cilt Bakımı",
  //           descriptions: "descriptions",
  //           createdAt: DateTime.now(),
  //           imageUrl: "imageUrl"),
  //       description: "description",
  //       price: 1,
  //       duration: DateTime.now(),
  //       serviceImage: ServiceImage(
  //           imageUrl:
  //               "https://im.haberturk.com/2018/11/08/2211673_b9bb20aeb3572f4e094f6490c276cdb1_640x640.jpg")),
  //   Service(
  //       id: 1,
  //       serviceTitle: "Kısa Saç Kesimi",
  //       barber: Barber(
  //           user: User(
  //               address: Address(
  //                   addressType: 1,
  //                   buildingNo: "123",
  //                   street: "Başağaç",
  //                   region: "region",
  //                   postalCode: 06730,
  //                   country: Country(
  //                       countryCode: 1,
  //                       countryName: "Türkiye",
  //                       province: Province(
  //                           provinceName: "Ankara",
  //                           district: District(districtName: "Beypazarı"))),
  //                   description: "Okulun karşısı",
  //                   coordinate: "coordinate"),
  //               userName: "şevval",
  //               password: "123456",
  //               permission: "permission",
  //               lastLogin: DateTime.now(),
  //               lastLogout: DateTime.now(),
  //               ipAddress: "123123"),
  //           barberName: "Şevval",
  //           barberSurname: "Şevval",
  //           bio: "bio",
  //           email: "email@gmail.com",
  //           profileImageUrl: "profileImageUrl",
  //           identityCard: "identityCard"),
  //       category: Category(
  //           categoryName: "Cilt Bakımı",
  //           descriptions: "descriptions",
  //           createdAt: DateTime.now(),
  //           imageUrl: "imageUrl"),
  //       description: "description",
  //       price: 1,
  //       duration: DateTime.now(),
  //       serviceImage: ServiceImage(
  //           imageUrl:
  //               "https://im.haberturk.com/2018/11/08/2211673_b9bb20aeb3572f4e094f6490c276cdb1_640x640.jpg")),
  //   Service(
  //       id: 2,
  //       serviceTitle: "Fön Çekimi",
  //       barber: Barber(
  //           user: User(
  //               address: Address(
  //                   addressType: 1,
  //                   buildingNo: "123",
  //                   street: "Başağaç",
  //                   region: "region",
  //                   postalCode: 06730,
  //                   country: Country(
  //                       countryCode: 1,
  //                       countryName: "Türkiye",
  //                       province: Province(
  //                           provinceName: "Ankara",
  //                           district: District(districtName: "Beypazarı"))),
  //                   description: "Okulun karşısı",
  //                   coordinate: "coordinate"),
  //               userName: "şevval",
  //               password: "123456",
  //               permission: "permission",
  //               lastLogin: DateTime.now(),
  //               lastLogout: DateTime.now(),
  //               ipAddress: "123123"),
  //           barberName: "Zülal",
  //           barberSurname: "Şevval",
  //           bio: "bio",
  //           email: "email@gmail.com",
  //           profileImageUrl: "profileImageUrl",
  //           identityCard: "identityCard"),
  //       category: Category(
  //           categoryName: "Saç Kesimi",
  //           descriptions: "descriptions",
  //           createdAt: DateTime.now(),
  //           imageUrl: "imageUrl"),
  //       description: "description",
  //       price: 1,
  //       duration: DateTime.now(),
  //       serviceImage: ServiceImage(
  //           imageUrl:
  //               "https://im.haberturk.com/2018/11/08/2211673_b80749590d6ede83f72b0fdedc3f30fb_640x640.jpg")),
  //   Service(
  //       id: 2,
  //       serviceTitle: "Fön Çekimi",
  //       barber: Barber(
  //           user: User(
  //               address: Address(
  //                   addressType: 1,
  //                   buildingNo: "123",
  //                   street: "Başağaç",
  //                   region: "region",
  //                   postalCode: 06730,
  //                   country: Country(
  //                       countryCode: 1,
  //                       countryName: "Türkiye",
  //                       province: Province(
  //                           provinceName: "Ankara",
  //                           district: District(districtName: "Beypazarı"))),
  //                   description: "Okulun karşısı",
  //                   coordinate: "coordinate"),
  //               userName: "şevval",
  //               password: "123456",
  //               permission: "permission",
  //               lastLogin: DateTime.now(),
  //               lastLogout: DateTime.now(),
  //               ipAddress: "123123"),
  //           barberName: "Zülal",
  //           barberSurname: "Şevval",
  //           bio: "bio",
  //           email: "email@gmail.com",
  //           profileImageUrl: "profileImageUrl",
  //           identityCard: "identityCard"),
  //       category: Category(
  //           categoryName: "Saç Kesimi",
  //           descriptions: "descriptions",
  //           createdAt: DateTime.now(),
  //           imageUrl: "imageUrl"),
  //       description: "description",
  //       price: 1,
  //       duration: DateTime.now(),
  //       serviceImage: ServiceImage(
  //           imageUrl:
  //               "https://im.haberturk.com/2018/11/08/2211673_b80749590d6ede83f72b0fdedc3f30fb_640x640.jpg")),
  //   Service(
  //       id: 2,
  //       serviceTitle: "Fön Çekimi",
  //       barber: Barber(
  //           user: User(
  //               address: Address(
  //                   addressType: 1,
  //                   buildingNo: "123",
  //                   street: "Başağaç",
  //                   region: "region",
  //                   postalCode: 06730,
  //                   country: Country(
  //                       countryCode: 1,
  //                       countryName: "Türkiye",
  //                       province: Province(
  //                           provinceName: "Ankara",
  //                           district: District(districtName: "Beypazarı"))),
  //                   description: "Okulun karşısı",
  //                   coordinate: "coordinate"),
  //               userName: "şevval",
  //               password: "123456",
  //               permission: "permission",
  //               lastLogin: DateTime.now(),
  //               lastLogout: DateTime.now(),
  //               ipAddress: "123123"),
  //           barberName: "Zülal",
  //           barberSurname: "Şevval",
  //           bio: "bio",
  //           email: "email@gmail.com",
  //           profileImageUrl: "profileImageUrl",
  //           identityCard: "identityCard"),
  //       category: Category(
  //           categoryName: "Saç Kesimi",
  //           descriptions: "descriptions",
  //           createdAt: DateTime.now(),
  //           imageUrl: "imageUrl"),
  //       description: "description",
  //       price: 1,
  //       duration: DateTime.now(),
  //       serviceImage: ServiceImage(
  //           imageUrl:
  //               "https://im.haberturk.com/2018/11/08/2211673_b80749590d6ede83f72b0fdedc3f30fb_640x640.jpg")),
  //   Service(
  //       id: 2,
  //       serviceTitle: "Fön Çekimi",
  //       barber: Barber(
  //           user: User(
  //               address: Address(
  //                   addressType: 1,
  //                   buildingNo: "123",
  //                   street: "Başağaç",
  //                   region: "region",
  //                   postalCode: 06730,
  //                   country: Country(
  //                       countryCode: 1,
  //                       countryName: "Türkiye",
  //                       province: Province(
  //                           provinceName: "Ankara",
  //                           district: District(districtName: "Beypazarı"))),
  //                   description: "Okulun karşısı",
  //                   coordinate: "coordinate"),
  //               userName: "şevval",
  //               password: "123456",
  //               permission: "permission",
  //               lastLogin: DateTime.now(),
  //               lastLogout: DateTime.now(),
  //               ipAddress: "123123"),
  //           barberName: "Zülal",
  //           barberSurname: "Şevval",
  //           bio: "bio",
  //           email: "email@gmail.com",
  //           profileImageUrl: "profileImageUrl",
  //           identityCard: "identityCard"),
  //       category: Category(
  //           categoryName: "Saç Kesimi",
  //           descriptions: "descriptions",
  //           createdAt: DateTime.now(),
  //           imageUrl: "imageUrl"),
  //       description: "description",
  //       price: 1,
  //       duration: DateTime.now(),
  //       serviceImage: ServiceImage(
  //           imageUrl:
  //               "https://im.haberturk.com/2018/11/08/2211673_b80749590d6ede83f72b0fdedc3f30fb_640x640.jpg")),
  //   Service(
  //       id: 2,
  //       serviceTitle: "Fön Çekimi",
  //       barber: Barber(
  //           user: User(
  //               address: Address(
  //                   addressType: 1,
  //                   buildingNo: "123",
  //                   street: "Başağaç",
  //                   region: "region",
  //                   postalCode: 06730,
  //                   country: Country(
  //                       countryCode: 1,
  //                       countryName: "Türkiye",
  //                       province: Province(
  //                           provinceName: "Ankara",
  //                           district: District(districtName: "Beypazarı"))),
  //                   description: "Okulun karşısı",
  //                   coordinate: "coordinate"),
  //               userName: "şevval",
  //               password: "123456",
  //               permission: "permission",
  //               lastLogin: DateTime.now(),
  //               lastLogout: DateTime.now(),
  //               ipAddress: "123123"),
  //           barberName: "Zülal",
  //           barberSurname: "Şevval",
  //           bio: "bio",
  //           email: "email@gmail.com",
  //           profileImageUrl: "profileImageUrl",
  //           identityCard: "identityCard"),
  //       category: Category(
  //           categoryName: "Saç Kesimi",
  //           descriptions: "descriptions",
  //           createdAt: DateTime.now(),
  //           imageUrl: "imageUrl"),
  //       description: "description",
  //       price: 1,
  //       duration: DateTime.now(),
  //       serviceImage: ServiceImage(
  //           imageUrl:
  //               "https://im.haberturk.com/2018/11/08/2211673_5bf192bab87e87d835d3a74d1f52deed_640x640.jpg")),
  //   Service(
  //       id: 2,
  //       serviceTitle: "Fön Çekimi",
  //       barber: Barber(
  //           user: User(
  //               address: Address(
  //                   addressType: 1,
  //                   buildingNo: "123",
  //                   street: "Başağaç",
  //                   region: "region",
  //                   postalCode: 06730,
  //                   country: Country(
  //                       countryCode: 1,
  //                       countryName: "Türkiye",
  //                       province: Province(
  //                           provinceName: "Ankara",
  //                           district: District(districtName: "Beypazarı"))),
  //                   description: "Okulun karşısı",
  //                   coordinate: "coordinate"),
  //               userName: "şevval",
  //               password: "123456",
  //               permission: "permission",
  //               lastLogin: DateTime.now(),
  //               lastLogout: DateTime.now(),
  //               ipAddress: "123123"),
  //           barberName: "Zülal",
  //           barberSurname: "Şevval",
  //           bio: "bio",
  //           email: "email@gmail.com",
  //           profileImageUrl: "profileImageUrl",
  //           identityCard: "identityCard"),
  //       category: Category(
  //           categoryName: "Saç Kesimi",
  //           descriptions: "descriptions",
  //           createdAt: DateTime.now(),
  //           imageUrl: "imageUrl"),
  //       description: "description",
  //       price: 1,
  //       duration: DateTime.now(),
  //       serviceImage: ServiceImage(
  //           imageUrl:
  //               "https://icdn.ensonhaber.com/crop/0x0/resimler/galeri/0_2315.jpg")),
  // ];

  List<Service> get serviceList => _serviceList;
  set serviceList(List<Service> value) {
    _serviceList.assignAll(value);
  }

  List<Service> get filteredServiceList => _filteredServiceList;
  set filteredServiceList(List<Service> value) {
    _filteredServiceList.assignAll(value);
  }

  @override
  void onReady() async {
    await fetchAllService();
  }

  final ServiceRepository serviceRepository = ServiceRepository();

  Future<void> fetchAllService() async {
    try {
      var fechedService = await serviceRepository.fetchAllServices();
      serviceList.assignAll(fechedService);
      filteredServiceList.assignAll(serviceList);
    } catch (e) {
      throw Exception("Failed to fetch service: $e");
    }
  }

  Future<void> addService(Service service) async {
    try {
      var newService = await serviceRepository.addService(service);
      if (newService != null) {
        serviceList.add(newService);
      }
    } catch (e) {
      print("hata");
    }
  }

  Future<void> updateService(int postId, Service updateService) async {
    try {
      var updated = await serviceRepository.updateService(postId, updateService);
      if (updated != null) {
        int index = serviceList.indexWhere((post) => post.id == postId);
        if (index != -1) {
          serviceList[index] = updated;
        }
      }
    } catch (e) {
      //Get.snackbar('Error', 'Could not update post: $e');
    }
  }

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

  void filterService(String categoryName) {
    if (categoryName == "Hepsi") {
      filteredServiceList.assignAll(serviceList);
    } else {
      filteredServiceList.assignAll(serviceList
          .where(
              (service) => service.category.categoryName.contains(categoryName))
          .toList());
    }
  }
}
