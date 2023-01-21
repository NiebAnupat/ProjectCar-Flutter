import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reserv_car_app/models/Car.dart';
import 'package:reserv_car_app/models/Reservation.dart';
import 'package:reserv_car_app/repository/carRepository.dart';

import '../getX/car/logic.dart';
import '../getX/user/logic.dart';
import '../models/Histories.dart';

class HistoryBox extends StatelessWidget {
  final Reservation reservation;
  final carLogic = Get.put(Carlogic());
  final userLogic = Get.put(Userlogic());
  var carName = '';
  var carImage = '';

  HistoryBox({required this.reservation}) {
    var car = Carlogic.cars.firstWhere((car) => car.id == reservation.carId);
    carName = car.name;
    carImage = car.image;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: ListTile(
          title: Text('ชื่อรถ : ${carName}',
              style: GoogleFonts.notoSansThai(fontSize: 18)),
          subtitle: Text('วันที่ : ${reservation.date}',
              style: GoogleFonts.notoSansThai(fontSize: 15)),

          // Tap to view details
          onTap: () {
            showDetails(context);
          },
        ),
      ),
    );
  }

  void showDetails(context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'รายละเอียดการจอง',
                style: GoogleFonts.notoSansThai(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Center(
              child: Container(
                width: 350,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    carImage,
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Image.network(
                          'https://cdn.pixabay.com/photo/2016/12/03/18/57/car-1880381_960_720.jpg');
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ทะเบียนรถ : ${reservation.carId}',
                    style: GoogleFonts.notoSansThai(fontSize: 16),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'ชื่อรถ     : ${carName}',
                    style: GoogleFonts.notoSansThai(fontSize: 16),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'วันที่จอง : ${reservation.date}',
                    style: GoogleFonts.notoSansThai(fontSize: 16),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  GetX<Userlogic>(
                    init: Userlogic(),
                    builder: (userLogic) {
                      return Text(
                        'ชื่อผู้จอง : ${userLogic.name.value}',
                        style: GoogleFonts.notoSansThai(fontSize: 16),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
