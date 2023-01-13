class Reservation {
  late final String id;
  final String date;
  final String carId;
  final String employeeId;

  Reservation(
      {required this.id,
      required this.date,
      required this.carId,
      required this.employeeId});

  Reservation.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        date = json['date'],
        carId = json['car_id'],
        employeeId = json['employee_id'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['car_id'] = carId;
    data['employee_id'] = employeeId;
    return data;
  }
}
