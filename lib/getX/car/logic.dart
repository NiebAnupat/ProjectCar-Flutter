import 'package:get/get.dart';
import '../../models/Car.dart';
import 'package:reserv_car_app/repository/carRepository.dart';

class Carlogic extends GetxController {
  static RxList<Car> cars = <Car>[].obs;
  RxList<Car> carsNotReserved = <Car>[].obs;
  var isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    loadCarByDate(DateTime.now());
  }

  // load car by date
  Future<void> loadCarByDate(DateTime date) async {
    isLoading.value = true;
    // fetch car from carRepository
    carsNotReserved.value =
        await carRepository.getCarNotReservedByDate(date) ?? <Car>[];
    isLoading.value = false;
  }

  // fetch cars
  static Future<void> fetchCars() async {
    cars.value = await carRepository.fetchCar() ?? <Car>[];
  }
}
