import 'package:get/get.dart';

class DashboardController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print("DashboardController onInit");
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
  void increment() => count.value++;
}
