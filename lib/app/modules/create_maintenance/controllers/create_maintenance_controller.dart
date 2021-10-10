import 'package:get/get.dart';

class CreateMaintenanceController extends GetxController {
  RxString dropdownValue = 'One'.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
