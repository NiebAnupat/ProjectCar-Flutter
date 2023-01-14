import 'package:get/get.dart';

class Userlogic extends GetxController {
  final id = 'ทดสอบ รหัสผ่าน'.obs;
  final password = ''.obs;
  final name = 'ทดสอบ ผู้ใช้งาน'.obs;
  final image = ''.obs;

  String get getImage => image.value == ''
      ? 'https://api.multiavatar.com/39169f35a316b9e1ee.png'
      : image.value;
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
}
