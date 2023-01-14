import 'package:reserv_car_app/models/Car.dart';
import 'package:reserv_car_app/repository/provider/carProvider.dart';

class carRepository {
  static Future<List<Car>?> fetchCar() async {
    try {
      return await carProvider.fetchCar();
    } catch (e, s) {
      rethrow;
    }
  }

  static Future<List<Car>?> getCarNotReservedByDate(DateTime date) async {
    try {
      return await carProvider.getCarNotReservedByDate(date);
    } catch (e, s) {
      rethrow;
    }
  }
}
