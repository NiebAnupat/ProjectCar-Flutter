import 'package:reserv_car_app/getX/user/logic.dart';
import 'package:reserv_car_app/repository/provider/googleSheetProvider.dart';

class employeeProvider {
  static Future login(String id, String password) async {
    try {
      // fetch data from google sheet
      final employeeSheet = await googleSheetProvider.employeeSheet;
      var allRows = await employeeSheet.values.map.allRows();
      if (allRows == null) {
        return null;
      }
      var employee = allRows
          .map((e) => EmployeeModel.fromJson(e))
          .firstWhere((e) => e.id == id && e.password == password);
      return employee;
    } catch (e) {
      rethrow;
    }
  }

  static Future FetchCurrentUserById(String id) async {
    // fetch data from google sheet
    try {
      final employeeSheet = await googleSheetProvider.employeeSheet;
      var allRows = await employeeSheet.values.map.allRows();
      if (allRows == null) {
        return null;
      }
      var user = allRows
          .map((e) => EmployeeModel.fromJson(e))
          .firstWhere((e) => e.id == id);

      return user;
    } catch (e) {
      rethrow;
    }
  }
}
