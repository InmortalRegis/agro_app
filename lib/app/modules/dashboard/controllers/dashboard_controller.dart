import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final List<String> images = [
    'img/banners/farms-robots.jpg',
    'img/banners/automation.jpg',
    'img/banners/smart-farm.jpg',
  ];

  int currentPage = 0;
  late Timer timer;
  final PageController pageController = PageController(
    initialPage: 0,
  );

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
}
