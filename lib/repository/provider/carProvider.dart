import 'package:reserv_car_app/models/Car.dart';
import 'googleSheetProvider.dart';

class carProvider {
  static Future<List<Car>?> fetchCar() async {
    try {
      // fetch data from google sheet
      final carSheet = await googleSheetProvider.carSheet;
      var allRows = await carSheet.values.map.allRows();
      if (allRows == null) {
        return null;
      }
      var cars = allRows.map((e) => Car.fromJson(e)).toList();
      return cars;
    } catch (e) {
      rethrow;
    }
  }
}
