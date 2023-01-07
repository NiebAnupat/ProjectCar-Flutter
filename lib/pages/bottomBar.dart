import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:reserv_car_app/pages/homePage.dart';
import 'package:reserv_car_app/pages/profilePage.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // final userLogic = Get.put(UserLogic());

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
      // if (index == 1) {
      //   // userLogic.logout();
      //   Get.offAll(() => LoginPage());
      // } else {
      //   _selectedIndex = index;
      // }
    });
  }

  final List<Widget> _barAction = [
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _barAction[_selectedIndex],

      // Bottom Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(255, 72, 167, 245),
        selectedItemColor: Colors.white,
        selectedLabelStyle: GoogleFonts.notoSansThai(),
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'โปรไฟล์',
          ),
        ],
      ),
    );
  }
}
