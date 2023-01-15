import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import '../components/carBox.dart';
import '../models/Car.dart';
import 'package:intl/intl.dart';
import '../getX/car/logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final carLogic = Get.put(Carlogic());
  var date = DateTime.now();
  var formatter = DateFormat('dd / MM / yyyy');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 35.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'วันจองรถ   ${formatter.format(date)}',
                    style: GoogleFonts.notoSansThai(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  GFIconButton(
                    icon: const Icon(Icons.calendar_today),
                    color: Colors.black,
                    type: GFButtonType.transparent,
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(2015),
                        lastDate: DateTime(2025),
                      );
                      if (newDate != null) {
                        setState(() {
                          date = newDate;
                        });
                        carLogic.loadCarByDate(newDate);
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: GetX<Carlogic>(
                builder: (carLogic) {
                  if (carLogic.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: carLogic.carsNotReserved.length,
                      itemBuilder: (context, index) {
                        return CarBox(
                          car: carLogic.carsNotReserved[index],
                          date: date,
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
