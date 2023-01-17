import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:reserv_car_app/pages/homePage.dart';
import 'package:reserv_car_app/pages/profilePage.dart';
import 'package:reserv_car_app/repository/reservationRepository.dart';
import '../getX/car/logic.dart';
import '../getX/reservation/logic.dart';
import '../getX/user/logic.dart';
import '../models/Histories.dart';
import '../components/historyBox.dart';
import '../models/Reservation.dart';
import 'bottomBar.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key}) {
    reservationLogic.isLoading.value = true;
    reservationRepository
        .fetchReservationByUserId(userLogic.id.value)
        .then((value) => {
              reservationLogic.reservations.value = value ?? <Reservation>[],
              reservationLogic.isLoading.value = false,
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAll(() => const BottomBar());
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: GetX<ReservationLogic>(
          builder: (reservationLogic) {
            if (reservationLogic.isLoading.value) {
              return const Center(
                child: GFLoader(
                  type: GFLoaderType.circle,
                  loaderColorOne: Colors.blue,
                  loaderColorTwo: Colors.blue,
                  loaderColorThree: Colors.blue,
                ),
              );
            } else {
              if (reservationLogic.reservations.isEmpty) {
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
                        reservation: reservationLogic.reservations[i]);
                  }),
                );
              }
            }
          },
        ),
      ),
    );
  }
}
