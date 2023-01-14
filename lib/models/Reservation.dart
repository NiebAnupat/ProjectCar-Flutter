import 'package:intl/intl.dart';

class Reservation {
  final String id;
  final String date;
  final String carId;
  final String employeeId;

  Reservation(
      {required this.id,
      required this.date,
      required this.carId,
      required this.employeeId});

  static makeReservationId() {
    var now = DateTime.now();
    var id = now.millisecondsSinceEpoch.toString();
    return id;
  }

  static Reservation fromJson(Map<String, dynamic> json) {
    var formatter = DateFormat('dd/MM/yyyy');
    var date = DateTime.fromMillisecondsSinceEpoch(
        (int.parse(json['date']) - 25569) * 86400000,
        isUtc: true);

    return Reservation(
      id: json['id'],
      date: formatter.format(date),
      carId: json['car_id'],
      employeeId: json['employee_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['car_id'] = carId;
    data['employee_id'] = employeeId;
    return data;
  }
}
