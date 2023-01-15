import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/Reservation.dart';
import 'googleSheetProvider.dart';

class reservationProvider {
  static Future<List<Reservation>?> fetchReservation() async {
    try {
      // fetch data from google sheet
      final reservationSheet = await googleSheetProvider.reservationSheet;
      var allRows = await reservationSheet.values.map.allRows();
      if (allRows == null) {
        return null;
      }
      var reservations = allRows.map((e) => Reservation.fromJson(e)).toList();
      return reservations;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Reservation>?> fetchReservationByCarId(
      String carId) async {
    try {
      // fetch data from google sheet
      final reservationSheet = await googleSheetProvider.reservationSheet;
      var allRows = await reservationSheet.values.map.allRows();
      if (allRows == null) {
        return null;
      }
      var reservations = allRows
          .map((e) => Reservation.fromJson(e))
          .where((e) => e.carId == carId)
          .toList();
      return reservations;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Reservation>?> fetchReservationByUserId(
      String userId) async {
    try {
      // loading dialog
      Get.dialog(
        const Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false,
      );

      final reservationSheet = await googleSheetProvider.reservationSheet;
      var allRows = await reservationSheet.values.map.allRows();
      if (allRows == null) {
        return null;
      }
      var reservations = allRows
          .map((e) => Reservation.fromJson(e))
          .where((e) => e.employeeId == userId)
          .toList();
      Get.back();
      return reservations;
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Reservation>?> fetchReservationByDate(
      DateTime date) async {
    try {
      final reservationSheet = await googleSheetProvider.reservationSheet;
      var allRows = await reservationSheet.values.map.allRows();
      if (allRows == null) {
        return null;
      }
      var reservations = allRows
          .map((e) => Reservation.fromJson(e))
          .where((e) => e.date == date)
          .toList();
      return reservations;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Reservation> addReservation(Reservation reservation) async {
    try {
      final reservationSheet = await googleSheetProvider.reservationSheet;
      await reservationSheet.values.map.appendRow(reservation.toJson());
      return reservation;
    } catch (e) {
      rethrow;
    }
  }
}
