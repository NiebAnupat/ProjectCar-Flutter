import 'package:get/get.dart';
import 'package:reserv_car_app/pages/bottomBar.dart';
import 'package:reserv_car_app/pages/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/employeeRepository.dart';

class Userlogic extends GetxController {
  final id = 'ทดสอบ รหัสผ่าน'.obs;
  final password = ''.obs;
  final name = 'ทดสอบ ผู้ใช้งาน'.obs;
  final image = ''.obs;
  final isLoading = false.obs;

  String get getImage => image.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    loadUser();
  }

  Future<void> saveUser(
      String id, String password, String name, String image) async {
    // save data to shared preferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('id', id);
    prefs.setString('password', password);
    prefs.setString('name', name);
    prefs.setString('image', image);
    // update data to userlogic
    this.id.value = id;
    this.password.value = password;
    this.name.value = name;
    this.image.value = image;
  }

  // load user from shared preferences
  Future<void> loadUser() async {
    try {
      this.isLoading.value = true;
      final prefs = await SharedPreferences.getInstance();
      final id = prefs.getString('id');
      if (id == null) return;
      final user = await EmployeeRepository.FetchCurrentUserById(id);
      if (user != null) {
        this.id.value = user.id;
        this.password.value = user.password;
        this.name.value = user.name;
        this.image.value = user.image;
        Get.offAll(const BottomBar());
      }
    } catch (e) {
      rethrow;
    } finally {
      this.isLoading.value = false;
    }
  }

  Future<void> clearUser() async {
    // clear data from shared preferences
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('id');
    prefs.remove('password');
    prefs.remove('name');
    prefs.remove('image');
    // update data to userlogic
    this.id.value = '';
    this.password.value = '';
    this.name.value = '';
    this.image.value = '';

    Get.offAll(LoginPage());
  }
}

class EmployeeModel {
  EmployeeModel({id, password, name, image});

  final userlogic = Userlogic();

  get name => userlogic.name.value;
  set name(value) => userlogic.name.value = value;

  get id => userlogic.id.value;
  set id(value) => userlogic.id.value = value;

  get password => userlogic.password.value;
  set password(value) => userlogic.password.value = value;

  get image => userlogic.image.value;
  set image(value) => userlogic.image.value = value;

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    password = json['password'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['password'] = password;
    data['name'] = name;
    data['image'] = image;
    return data;
  }

  // toString
  @override
  String toString() {
    return 'EmployeeModel{id: $id, password: $password, name: $name, image: $image}';
  }
}
