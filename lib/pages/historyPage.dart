import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:reserv_car_app/repository/reservationRepository.dart';
import '../getX/car/logic.dart';
import '../getX/reservation/logic.dart';
import '../getX/user/logic.dart';
import '../models/Histories.dart';
import '../components/historyBox.dart';
import '../models/Reservation.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key}) {
    reservationRepository
        .fetchReservationByUserId(userLogic.id.value)
        .then((value) => {
              reservationLogic.reservations.value = value ?? <Reservation>[],
            });
  }

  final userLogic = Get.put(Userlogic());
  final reservationLogic = Get.put(ReservationLogic());
  final carLogic = Get.put(Carlogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ประวัติการจอง',
          style: GoogleFonts.notoSansThai(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      // Body
      body: Center(
        child: Expanded(
            child: Padding(
          padding: const EdgeInsets.all(5),
          child: GetX<ReservationLogic>(
            builder: (reservationLogic) {
              if (reservationLogic.reservations.value.length == 0) {
                return Center(
                  child: Text(
                    'ไม่มีประวัติการจอง',
                    style: GoogleFonts.notoSansThai(fontSize: 20),
                  ),
                );
              } else {
                return ListView.builder(
                  itemCount: reservationLogic.reservations.length,
                  itemBuilder: ((context, i) {
                    return HistoryBox(
                        reservation: reservationLogic.reservations.value[i]);
                  }),
                );
              }
            },
          ),
        )),
      ),
    );
  }
}
