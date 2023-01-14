import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:reserv_car_app/pages/loginPage.dart';

class RegistPage extends StatelessWidget {
  const RegistPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 36, 110, 175),
                Color.fromARGB(255, 72, 167, 245),
              ],
              begin: Alignment.topLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 36.0, horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Car App",
                        style: GoogleFonts.lobsterTwo(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "สมัครสมาชิกจองรถยนต์สำหรับพนักงาน",
                        style: GoogleFonts.notoSansThai(
                            fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Back button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GFIconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.blue,
                                size: 25,
                              ),
                              type: GFButtonType.transparent,
                            ),
                          ],
                        ),

                        // Logo
                        Image.asset(
                          'assets/images/regist.png',
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 40.0),

                        // Username
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 240, 240, 240),
                            hintText: 'ชื่อผู้ใช้',
                            hintStyle: GoogleFonts.notoSansThai(),
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        // ID Number
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 240, 240, 240),
                            hintText: 'รหัสพนักงาน',
                            hintStyle: GoogleFonts.notoSansThai(),
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        // Password
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(255, 240, 240, 240),
                            hintText: 'รหัสผ่าน',
                            hintStyle: GoogleFonts.notoSansThai(),
                          ),
                        ),
                        const SizedBox(height: 30.0),

                        // Login Button
                        GFButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => LoginPage()));
                          },
                          text: "ยืนยันการสมัคร",
                          color: Color.fromARGB(255, 94, 171, 235),
                          textStyle: GoogleFonts.notoSansThai(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                          fullWidthButton: true,
                          shape: GFButtonShape.pills,
                          size: GFSize.LARGE,
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
