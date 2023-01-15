import 'package:get/get.dart';
import 'package:reserv_car_app/getX/car/logic.dart';

import 'package:reserv_car_app/repository/reservationRepository.dart';
import '../../models/Reservation.dart';

class ReservationLogic extends GetxController {
  RxList<Reservation> reservations = <Reservation>[].obs;
  var isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    Carlogic.fetchCars();
  }
}
