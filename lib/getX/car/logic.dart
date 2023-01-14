import 'package:get/get.dart';
import '../../models/Car.dart';
import 'package:reserv_car_app/repository/carRepository.dart';

class Carlogic extends GetxController {
  RxList<Car> cars = <Car>[].obs;
  var isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    isLoading.value = true;

    // fetch car from carRepository
    cars.value = await carRepository.fetchCar() ?? <Car>[];

    isLoading.value = false;
  }
}
