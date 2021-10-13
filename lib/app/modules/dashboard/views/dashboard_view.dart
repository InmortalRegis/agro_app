import 'package:agro_app/app/core/utils/helpers.dart';
import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:agro_app/app/modules/dashboard/local_widgets/agro_header.dart';
import 'package:agro_app/app/modules/dashboard/local_widgets/menu_item.dart';
import 'package:agro_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('🍀 Agro App'),
      ),
      body: Column(
        children: [
          Banners(
            size: _size,
            controller: controller,
          ),
          DashboardBody(),
        ],
      ),
    );
  }
}

class Banners extends StatelessWidget {
  const Banners({
    Key? key,
    required Size size,
    required this.controller,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final DashboardController controller;

  @override
  Widget build(BuildContext context) {
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

class DashboardBody extends StatelessWidget {
  const DashboardBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              child: AgroHeader(),
              left: 0,
              right: 0,
              top: 20.0,
            ),
            Positioned(
              child: AgroBg(),
              left: 0,
              right: 0,
              bottom: 0,
            ),
            Positioned(
              bottom: _size.height * 0.30,
              left: 0.0,
              right: 0.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MenuItemCard(
                      title: 'Cultivos',
                      iconImage: path(
                        'img/icons/sprout.png',
                      ),
                      to: Routes.CROPS,
                    ),
                  ),
                  Expanded(
                    child: MenuItemCard(
                      title: 'Mantenimiento',
                      iconImage: path(
                        'img/icons/tractor.png',
                      ),
                      to: Routes.MAINTENANCE,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AgroBg extends StatelessWidget {
  const AgroBg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .45,
      padding: EdgeInsets.symmetric(
        vertical: 30.0,
        horizontal: 10.0,
      ),
      // color: AppColors.parsley,
      decoration: BoxDecoration(
        color: AppColors.parsley,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(40.0),
        ),
      ),
    );
  }
}
