import 'package:agro_app/app/core/utils/helpers.dart';
import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:agro_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/crops_controller.dart';

class CropsView extends GetView<CropsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🌿 Cultivos'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          CropItem(),
          CropItem(),
          CropItem(),
          CropItem(),
          CropItem(),
          CropItem(),
          CropItem(),
          CropItem(),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Get.toNamed(Routes.CREATE_CROP);
        },
      ),
    );
  }
}

class CropItem extends StatelessWidget {
  const CropItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(15.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.kPrimaryColor.withOpacity(0.25),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.periwinkle,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image(
                height: 35.0,
                width: 35.0,
                image: AssetImage(
                  path('img/icons/crops.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cebolla',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Sub-Terreno 1',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    DateFormat('yyyy-MM-dd hh:mm').format(DateTime.now()),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
