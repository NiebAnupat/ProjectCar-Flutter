import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reserv_car_app/getX/user/logic.dart';
import 'package:reserv_car_app/repository/provider/googleSheetProvider.dart';

class employeeProvider {
  static Future login(String id, String password) async {
    try {
      // loading dialog
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );

      // fetch data from google sheet
      final employeeSheet = await googleSheetProvider.employeeSheet;
      var allRows = await employeeSheet.values.map.allRows();
      if (allRows == null) {
        return null;
      }
      var employee = allRows
          .map((e) => EmployeeModel.fromJson(e))
          .firstWhere((e) => e.id == id && e.password == password);
      Get.back();
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

  // register new employee
  static Future register(EmployeeModel employee) async {
    try {
      final employeeSheet = await googleSheetProvider.employeeSheet;
      var allRows = await employeeSheet.values.map.allRows();
      if (allRows == null) {
        await employeeSheet.values.map.appendRow(employee.toJson());
        Get.back();
        Get.snackbar(
          'สมัครสมาชิกสำเร็จ',
          'พนักงาน ${employee.name} รหัส ${employee.id} สมัครสมาชิกสำเร็จ',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
        );
        await Future.delayed(const Duration(seconds: 2));
        return employee;
      }
      var employeeId = allRows.map((e) => e['id']).toList();
      if (employeeId.contains(employee.id)) {
        Get.back();
        // show get x snackbar
        Get.snackbar(
          'สมัครสมาชิกไม่สำเร็จ',
          'รหัสพนักงานนี้มีอยู่ในระบบแล้ว',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
        );
        return null;
      }
      await employeeSheet.values.map.appendRow(employee.toJson());
      Get.back();
      Get.snackbar(
        'สมัครสมาชิกสำเร็จ',
        'พนักงาน ${employee.name} รหัส ${employee.id} สมัครสมาชิกสำเร็จ',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
      );
      await Future.delayed(const Duration(seconds: 2));

      return employee;
    } catch (e) {
      Get.snackbar(
        'สมัครสมาชิกไม่สำเร็จ',
        'กรุณาลองใหม่อีกครั้ง',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
      );
      rethrow;
    }
  }
}
