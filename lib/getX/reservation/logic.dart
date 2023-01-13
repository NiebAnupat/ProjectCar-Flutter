import 'package:get/get.dart';

import '../../models/Reservation.dart';

class ReservationLogic extends GetxController {
  RxList<Reservation> reservations = <Reservation>[].obs;
  var isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    isLoading.value = false;
  }
}
