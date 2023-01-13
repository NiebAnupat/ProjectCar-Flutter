import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:reserv_car_app/models/Car.dart';

class CarBox extends StatelessWidget {
  final Car car;
  CarBox({required this.car});

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

          // Tap to input detail
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
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ทะเบียนรถ : ${car.id}',
                style: GoogleFonts.notoSansThai(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'ชื่อรถ     :  ${car.name}',
                style: GoogleFonts.notoSansThai(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'วันที่จอง : ',
                style: GoogleFonts.notoSansThai(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                'ชื่อผู้จอง : ',
                style: GoogleFonts.notoSansThai(fontSize: 16),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text("ยกเลิก"),
            ),
            TextButton(
              onPressed: () {},
              child: Text("ยืนยัน"),
            ),
          ],
        ),
      );
}
