import 'package:agro_app/app/core/utils/helpers.dart';
import 'package:agro_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Banners extends StatelessWidget {
  final controller = Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.zero,
      height: _size.height * 0.152,
      child: PageView.builder(
        padEnds: false,
        scrollDirection: Axis.horizontal,
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        itemCount: controller.images.length,
        itemBuilder: (ctx, i) => Image(
          width: _size.width,
          image: AssetImage(
            path(
              controller.images[i],
            ),
          ),
        ),
      ),
    );
  }
}
