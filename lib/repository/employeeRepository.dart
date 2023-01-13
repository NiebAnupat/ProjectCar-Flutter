import './provider/employeeProvider.dart';

class EmployeeRepository {
  static Future login(String id, String password) async {
    try {
      return await employeeProvider.login(id, password);
    } catch (e, s) {
      rethrow;
    }
  }

  static Future FetchCurrentUserById(String id) async {
    try {
      return await employeeProvider.FetchCurrentUserById(id);
    } catch (e) {
      rethrow;
    }
  }
}
