import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/Histories.dart';

class HistoryBox extends StatelessWidget {
  const HistoryBox({super.key});

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
          title:
              Text("ทะเบียนรถ", style: GoogleFonts.notoSansThai(fontSize: 18)),
          subtitle:
              Text("วันที่", style: GoogleFonts.notoSansThai(fontSize: 15)),

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  color: Colors.blue[100],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                      image: NetworkImage(
                          'https://cdn.pixabay.com/photo/2016/12/03/18/57/car-1880381_960_720.jpg')),
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
                    'ทะเบียนรถ : ',
                    style: GoogleFonts.notoSansThai(fontSize: 16),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'ยี่ห้อรถ : ',
                    style: GoogleFonts.notoSansThai(fontSize: 16),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'วันที่จอง : ',
                    style: GoogleFonts.notoSansThai(fontSize: 16),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'ชื่อผู้จอง : ',
                    style: GoogleFonts.notoSansThai(fontSize: 16),
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
