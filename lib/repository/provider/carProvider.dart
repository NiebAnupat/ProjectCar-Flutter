import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:reserv_car_app/models/Car.dart';
import '../../getX/car/logic.dart';
import '../../models/Reservation.dart';
import 'googleSheetProvider.dart';
import 'dart:convert';

class carProvider {
  final carLogic = Get.put(Carlogic());

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

  static Future<List<Car>?> getCarNotReservedByDate(DateTime date) async {
    try {
      // fetch data from google sheet
      final carSheet = await googleSheetProvider.carSheet;
      var allRows = await carSheet.values.map.allRows();
      if (allRows == null) {
        return null;
      }
      var cars = allRows.map((e) => Car.fromJson(e)).toList();

      // fetch reservation from google sheet
      final reservationSheet = await googleSheetProvider.reservationSheet;
      var allRowsReservation = await reservationSheet.values.map.allRows();
      if (allRowsReservation == null) {
        return cars;
      }

      var formatter = DateFormat('dd/MM/yyyy');
      var formattedDate = formatter.format(date);

      var reservations = allRowsReservation
          .map((e) => Reservation.fromJson(e))
          .where((e) => e.date == formattedDate)
          .toList();

      for (var reservation in reservations) {
        cars.removeWhere((car) => car.id == reservation.carId);
      }

      return cars;

      // return cars;
    } catch (e) {
      rethrow;
    }
  }
}
