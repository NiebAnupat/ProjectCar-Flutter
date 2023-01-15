import 'package:get/get.dart';

import '../getX/user/logic.dart';
import './provider/employeeProvider.dart';

class EmployeeRepository {
  static Future login(String id, String password) async {
    try {
      return await employeeProvider.login(id, password);
    } catch (e, s) {
      Get.back();
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

  static Future register(EmployeeModel employee) async {
    try {
      return await employeeProvider.register(employee);
    } catch (e) {
      rethrow;
    }
  }
}
