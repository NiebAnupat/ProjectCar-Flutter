import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20),
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

                  // Car list
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
