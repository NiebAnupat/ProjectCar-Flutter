import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:getwidget/getwidget.dart';
import '../getX/user/logic.dart';
import 'loginPage.dart';
import 'historyPage.dart';

class ProfilePage extends StatelessWidget {
  final userLogic = Get.put(Userlogic());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue[100],
              image: const DecorationImage(
                image: NetworkImage(
                    'https://cdn.pixabay.com/photo/2016/11/22/19/33/conifers-1850227_960_720.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: GetX<Userlogic>(
              builder: (userLogic) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: CircleAvatar(
                            child: ClipOval(
                          child: Image.network(
                            userLogic.getImage,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.network(
                                  'https://api.multiavatar.com/39169f35a316b9e1ee.png');
                            },
                          ),
                        ))),
                    const SizedBox(height: 10),
                    Text(
                      userLogic.name.value,
                      style: GoogleFonts.notoSansThai(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      userLogic.id.value,
                      style: GoogleFonts.notoSansThai(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                GFListTile(
                  title: Text(
                    'ประวัติการจอง',
                    style: GoogleFonts.notoSansThai(
                      fontSize: 20,
                    ),
                  ),
                  icon: const Icon(
                    Icons.history,
                    color: Color.fromARGB(255, 72, 167, 245),
                  ),
                  onTap: () {
                    Get.to(() => HistoryPage());
                  },
                ),
                GFListTile(
                  title: Text(
                    'ออกจากระบบ',
                    style: GoogleFonts.notoSansThai(
                      fontSize: 20,
                    ),
                  ),
                  icon: const Icon(
                    Icons.logout,
                    color: Color.fromARGB(255, 72, 167, 245),
                  ),
                  onTap: () {
                    userLogic.clearUser();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
