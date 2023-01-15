import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reserv_car_app/pages/bottomBar.dart';
import '../repository/employeeRepository.dart';
import 'registerPage.dart';
import 'package:get/get.dart';
import '../getX/user/logic.dart';

class LoginPage extends StatelessWidget {
  final userlogic = Get.put(Userlogic());

  @override
  Widget build(BuildContext context) {
    final idController = TextEditingController();
    final passwordController = TextEditingController();

    loginUser() async {
      try {
        final user = await EmployeeRepository.login(
            idController.text, passwordController.text);
        await userlogic.saveUser(user.id, user.password, user.name, user.image);
        Get.offAll(const BottomBar());
      } catch (e) {
        Get.snackbar(
            'เข้าสู่ระบบไม่สำเร็จ', 'กรุณาตรวจสอบรหัสพนักงานและรหัสผ่าน',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
            duration: const Duration(seconds: 1));
      }
    }

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
                        "เข้าสู่ระบบจองรถยนต์สำหรับพนักงาน",
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
                        // Logo
                        Image.asset(
                          'assets/images/carlogo.png',
                          width: 100,
                          height: 100,
                        ),
                        const SizedBox(height: 40.0),

                        // ID Number
                        TextField(
                          onSubmitted: (value) => loginUser(),
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
                            prefixIcon: const Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(height: 15.0),

                        // Password
                        TextField(
                          onSubmitted: (value) => loginUser(),
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 240, 240, 240),
                            hintText: 'รหัสผ่าน',
                            hintStyle: GoogleFonts.notoSansThai(),
                            prefixIcon: const Icon(Icons.lock),
                          ),
                        ),
                        const SizedBox(height: 30.0),

                        // Login Button
                        GFButton(
                          onPressed: () {
                            loginUser();
                          },
                          text: "เข้าสู่ระบบ",
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

                        // Register
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("ยังไม่มีบัญชีสำหรับพนักงาน ?",
                                style: GoogleFonts.notoSansThai(
                                    fontSize: 15, color: Colors.grey)),
                            TextButton(
                              onPressed: () {
                                Get.offAll(RegistPage());
                              },
                              child: Text(
                                "สมัคร",
                                style: GoogleFonts.notoSansThai(
                                    fontSize: 18,
                                    color:
                                        const Color.fromARGB(255, 94, 171, 235),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
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
