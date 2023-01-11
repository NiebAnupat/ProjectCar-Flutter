import 'package:get/get.dart';
import '../../models/Cars.dart';

class Carlogic extends GetxController {
  RxList<Cars> car = <Cars>[].obs;
  var isLoading = true.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    isLoading.value = false;
  }
}
