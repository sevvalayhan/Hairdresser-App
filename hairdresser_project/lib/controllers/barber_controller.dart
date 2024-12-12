import 'package:get/get.dart';
import 'package:hairdresser_project/models/barber.dart';
import 'package:hairdresser_project/repositories/barber_repository.dart';

class BarberController extends GetxController {
  final _barberList = <Barber>[].obs;
  final _searchBarberList = <Barber>[].obs;
  final _filteredBarberList = <Barber>[].obs;

  List<Barber> get barberList => _barberList;
  set barberList(List<Barber> value) {
    _barberList.assignAll(value);
  }

  List<Barber> get searchBarberList => _searchBarberList;
  set searchBarberList(List<Barber> value) {
    _searchBarberList.assignAll(value);
  }

  List<Barber> get filteredBarberList => _filteredBarberList;
  set filteredBarberList(List<Barber> value) {
    _filteredBarberList.assignAll(value);
  }

  @override
  void onReady() async {
    await fetchAllBarbers();
  }

  BarberRepository barberRepository = BarberRepository();
  Future<void> fetchAllBarbers() async {
    try {
      List<Barber> fechedBarbers = await barberRepository.fetchAllBarbers();
      if (fechedBarbers.isNotEmpty) {
        barberList.assignAll(fechedBarbers);
        filteredBarberList.assignAll(barberList);
      } else {
        throw Exception("Barber data is null");
      }
    } catch (e) {
      throw Exception("Failed to fetch Barber data: $e ");
    }
  }

  Future<void> fetchSearchBarbers(String searchText) async {
    try {
      List<Barber> searchData =
          await barberRepository.fetchSearchBarbers(searchText);
      if (searchData.isNotEmpty) {
        searchBarberList.assignAll(searchData);
      } else {
        searchBarberList.assignAll(<Barber>[]);
      }
    } catch (e) {
      throw Exception("Failed to fetch Barber data: $e ");
    }
  }

  void filterList() {}
}
