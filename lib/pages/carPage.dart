import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';

class CarPage extends StatelessWidget {
  const CarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        title: Text('Car Reservations',
            style: GoogleFonts.notoSansThai(fontSize: 20)),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 36, 110, 175),
      ),
    );
    ;
  }
}
