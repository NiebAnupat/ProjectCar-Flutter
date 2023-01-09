import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import '../models/Histories.dart';
import '../components/historyBox.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

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
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(5),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: ((context, i) {
                  return HistoryBox();
                }),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
