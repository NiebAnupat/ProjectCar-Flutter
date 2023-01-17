import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:reserv_car_app/models/Car.dart';
import 'package:reserv_car_app/models/Reservation.dart';
import 'package:reserv_car_app/repository/reservationRepository.dart';

import '../getX/car/logic.dart';
import '../getX/reservation/logic.dart';
import '../getX/user/logic.dart';

class CarBox extends StatelessWidget {
  final Car car;
  final DateTime date;
  var formatter = DateFormat('dd / MM / yyyy');

  CarBox({required this.car, required this.date});

  final userLogic = Get.put(Userlogic());
  final carLogic = Get.put(Carlogic());
  final reservationLogic = Get.put(ReservationLogic());

  submitReservation() async {
    try {
      Get.back();
      Get.defaultDialog(
        contentPadding: const EdgeInsets.all(40),
        title: 'กำลังจองรถ',
        titleStyle: GoogleFonts.notoSansThai(
          fontSize: 20,
          color: Colors.black,
        ),
        middleText: 'กรุณารอสักครู่',
        middleTextStyle: GoogleFonts.notoSansThai(
          fontSize: 18,
          color: Colors.black,
        ),
        barrierDismissible: false,
        content: const Center(
          child: GFLoader(
            type: GFLoaderType.circle,
            loaderColorOne: Colors.blue,
            loaderColorTwo: Colors.blue,
            loaderColorThree: Colors.blue,
          ),
        ),
      );
      final dateFormatted = DateFormat('dd/MM/yyyy').format(date);
      final newReservation = Reservation(
          id: Reservation.makeReservationId(),
          date: dateFormatted,
          carId: car.id,
          employeeId: userLogic.id.value);

      await reservationRepository.createReservation(newReservation);

      // add new reservation to reservation list
      reservationLogic.reservations.add(newReservation);

      Get.back();
      Get.snackbar(
        'ทำการจองรถสำเร็จ',
        'การจองรถเลขทะเบียน ${car.id} วันที่ $dateFormatted สำเร็จ หมายเลขการจองของคุณคือ ${newReservation.id}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        margin: const EdgeInsets.only(bottom: 70, left: 10, right: 10),
      );

      carLogic.loadCarByDate(date);
    } catch (e) {
      Get.back();
      // getX snack-bar error
      Get.snackbar(
        'เกิดข้อผิดพลาด',
        'กรุณาลองใหม่อีกครั้ง',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.only(bottom: 70, left: 10, right: 10),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            car.image,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: ListTile(
          title: Text(car.name, style: GoogleFonts.notoSansThai(fontSize: 18)),
          subtitle: Text(car.id, style: GoogleFonts.notoSansThai(fontSize: 15)),
          onTap: () {
            confirmDialog(context);
          },
        ),
      ),
    );
  }

  Future confirmDialog(context) => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
              child: Text("ยืนยันการจองรถ",
                  style: GoogleFonts.notoSansThai(fontSize: 18))),
          content: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Wrap(
              runSpacing: 10,
              children: [
                Text(
                  'ทะเบียนรถ : ${car.id}',
                  style: GoogleFonts.notoSansThai(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  'ชื่อรถ     :  ${car.name}',
                  style: GoogleFonts.notoSansThai(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  'วันที่จอง :  ${formatter.format(date)}',
                  style: GoogleFonts.notoSansThai(fontSize: 16),
                ),
                const SizedBox(height: 5),
                GetX<Userlogic>(
                  builder: (userLogic) {
                    return Text(
                      'ชื่อผู้จอง :  ${userLogic.name.value}',
                      style: GoogleFonts.notoSansThai(fontSize: 16),
                    );
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text("ยกเลิก",
                  style: GoogleFonts.notoSansThai(
                      fontSize: 16, color: Colors.red)),
            ),
            TextButton(
              onPressed: submitReservation,
              child: Text("ยืนยัน",
                  style: GoogleFonts.notoSansThai(
                      fontSize: 16, color: Colors.green)),
            ),
          ],
        ),
      );
}
