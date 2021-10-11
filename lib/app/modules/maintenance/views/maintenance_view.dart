import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:agro_app/app/modules/maintenance/local_widgets/maintenance_item.dart';
import 'package:agro_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/maintenance_controller.dart';

class MaintenanceView extends GetView<MaintenanceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mantenimientos'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.maintenances.isNotEmpty
              ? Column(
                  children: controller.maintenances
                      .map((element) => MaintenanceItem(
                            icon: Icons.settings,
                            iconBgColor: AppColors.goblin,
                            maintenance: element,
                          ))
                      .toList(),
                ).paddingAll(10.0)
              : Container(
                  height: MediaQuery.of(context).size.height * .9,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Get.toNamed(Routes.CREATE_MAINTENANCE);
        },
      ),
    );
  }
}
