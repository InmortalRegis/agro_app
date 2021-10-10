import 'package:get/get.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print('HomeController OnInit!');
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
  void increment() => count.value++;
}
