import 'package:reserv_car_app/getx/employeeModel.dart';
import 'package:reserv_car_app/repository/provider/googleSheetProvider.dart';

class employeeProvider {
  static Future login(String id, String password) async {
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
  }
}
