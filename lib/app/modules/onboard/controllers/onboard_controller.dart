import 'dart:async';

import 'package:agro_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

class OnboardController extends GetxController {
  final List<String> images = [
    'img/splash/maintenance.png',
    'img/splash/fruits-vegetables.png',
  ];

  int currentPage = 0;
  late Timer timer;
  final PageController pageController = PageController(initialPage: 0);
  // final box = GetStorage();
  @override
  void onInit() {
    super.onInit();

    timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void onReady() {}

  @override
  void onClose() {
    pageController.dispose();
    timer.cancel();
  }

  void onPageChanged(int index) {
    currentPage = index;
  }

  void letsBegin() {
    timer.cancel();
    Get.offNamed(Routes.DASHBOARD);
  }
}
