import 'package:get/get.dart';

import 'package:reserv_car_app/repository/reservationRepository.dart';
import '../../models/Reservation.dart';

class ReservationLogic extends GetxController {
  RxList<Reservation> reservations = <Reservation>[].obs;
  var isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    isLoading.value = false;
  }

  Future<void> fetchReservation() async {
    // isLoading.value = true;

    // fetch reservation from reservationRepository
    // reservations.value = await reservationRepository.fetchReservation() ?? <Reservation>[];

    // isLoading.value = false;
  }
}
