import 'package:get/get.dart';

class RxEmployeeModel {
  final id = 'id'.obs;
  final password = 'password'.obs;
  final name = 'name'.obs;
  final image = 'image'.obs;
}

class EmployeeModel {
  EmployeeModel({id, name, image});

  final rx = RxEmployeeModel();

  get id => rx.id.value;
  set id(value) => rx.id.value = value;

  get password => rx.password.value;
  set password(value) => rx.password.value = value;

  get name => rx.name.value;
  set name(value) => rx.name.value = value;

  get image => rx.image.value;
  set image(value) => rx.image.value = value;

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
