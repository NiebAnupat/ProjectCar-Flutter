import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import '../components/carBox.dart';
import '../models/Car.dart';
import '../getX/car/logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _dateTime = DateTime.now();
  final carLogic = Get.put(Carlogic());

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
                    'วันจองรถ   ${_dateTime.day} - ${_dateTime.month} - ${_dateTime.year}',
                    style: GoogleFonts.notoSansThai(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  GFIconButton(
                    icon: Icon(Icons.calendar_today),
                    color: Colors.black,
                    type: GFButtonType.transparent,
                    onPressed: () async {
                      DateTime? _newDate = await showDatePicker(
                        context: context,
                        initialDate: _dateTime,
                        firstDate: DateTime(2015),
                        lastDate: DateTime(2025),
                      );
                      if (_newDate != null) {
                        setState(() {
                          _dateTime = _newDate;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: GetX<Carlogic>(
                builder: (carLogic) {
                  return ListView.builder(
                    itemCount: carLogic.cars.length,
                    itemBuilder: (context, index) {
                      return CarBox(car: carLogic.cars[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
