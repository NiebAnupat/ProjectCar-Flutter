import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:reserv_car_app/getX/user/logic.dart';
import 'package:reserv_car_app/pages/loginPage.dart';

import '../repository/employeeRepository.dart';

class RegistPage extends StatelessWidget {
  final idController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  register() {
    try {
      if (idController.text == '' ||
          passwordController.text == '' ||
          nameController.text == '') {
        Get.snackbar(
          'กรุณากรอกข้อมูลให้ครบ',
          'กรุณากรอกข้อมูลให้ครบ',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
        );
      } else {
        // getX confirm dialog
        Get.defaultDialog(
          title: 'ยืนยันการสมัครสมาชิก',
          titleStyle: GoogleFonts.notoSansThai(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          content: Text('คุณต้องการสมัครสมาชิกใช่หรือไม่',
              style: GoogleFonts.notoSansThai()),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('ยกเลิก',
                  style: GoogleFonts.notoSansThai(
                      color: Colors.red, fontWeight: FontWeight.bold)),
            ),
            TextButton(
              onPressed: () async {
                Get.back();

                // show loading dialog
                Get.dialog(
                  const Center(
                    child: GFLoader(
                      type: GFLoaderType.circle,
                      loaderColorOne: Colors.blue,
                      loaderColorTwo: Colors.blue,
                      loaderColorThree: Colors.blue,
                    ),
                  ),
                  barrierDismissible: false,
                );
                final newEmployee = EmployeeModel(
                  id: idController.text,
                  password: passwordController.text,
                  name: nameController.text,
                );
                EmployeeRepository.register(newEmployee).then((value) {
                  if (value != null) {
                    Get.back();
                    Get.offAll(LoginPage());
                  }
                });
              },
              child: Text('ยืนยัน',
                  style: GoogleFonts.notoSansThai(
                      color: Colors.blue, fontWeight: FontWeight.bold)),
            ),
          ],
        );
      }
    } catch (e) {}
  }

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
                      const SizedBox(height: 8),
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
                  decoration: const BoxDecoration(
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
                                Get.off(LoginPage());
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
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 240, 240, 240),
                            hintText: 'ชื่อผู้ใช้',
                            hintStyle: GoogleFonts.notoSansThai(),
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        // ID Number
                        TextField(
                          controller: idController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 240, 240, 240),
                            hintText: 'รหัสพนักงาน',
                            hintStyle: GoogleFonts.notoSansThai(),
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        // Password
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 240, 240, 240),
                            hintText: 'รหัสผ่าน',
                            hintStyle: GoogleFonts.notoSansThai(),
                          ),
                        ),
                        const SizedBox(height: 30.0),

                        // Login Button
                        GFButton(
                          onPressed: register,
                          text: "ยืนยันการสมัคร",
                          color: const Color.fromARGB(255, 94, 171, 235),
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
