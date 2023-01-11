import 'package:get/get.dart';

class Userlogic extends GetxController {
  final id = 0.obs;
  final name = 'name'.obs;
  final image = 'image'.obs;
}

class EmployeeModel {
  EmployeeModel({id, name, image});

  final userlogic = Userlogic();

  get name => userlogic.name.value;
  set name(value) => userlogic.name.value = value;

  get id => userlogic.id.value;
  set id(value) => userlogic.id.value = value;

  get image => userlogic.image.value;
  set image(value) => userlogic.image.value = value;

  EmployeeModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
