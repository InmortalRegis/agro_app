import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:agro_app/app/global_widgets/app_button.dart';
import 'package:agro_app/app/modules/create_maintenance/local_widgets/app_drowdown_labeled.dart';
import 'package:agro_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_crop_controller.dart';

class CreateCropView extends GetView<CreateCropController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('☘️ Crear cultivo'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(
          bottom: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              Obx(
                () => AppDropdownLabeled(
                  label: 'Tipo',
                  selectedValue: controller.selectedType.value,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.onSelectedType(newValue);
                    }
                  },
                  items: controller.cropTypes
                      .map((e) => {
                            "value": e.idtipoCultivos.toString(),
                            "text": e.tcNombre,
                          })
                      .toList(),
                ),
              ),
              Obx(
                () => AppDropdownLabeled(
                  label: 'Sub-Terreno',
                  selectedValue: controller.selectedSubGround.value,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.onSelectedSubGround(newValue);
                    }
                  },
                  items: controller.subGrounds
                      .map((e) => {
                            "value": e.idsubterreno.toString(),
                            "text": e.nombre,
                          })
                      .toList(),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(
                child: Text(
                  'Guardar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
                onTab: () {
                  Get.toNamed(Routes.CROPS);

                  Get.snackbar(
                    "Guardado",
                    "Se ha guardado correctamente",
                    icon: Icon(Icons.check, color: Colors.white),
                    snackPosition: SnackPosition.TOP,
                    colorText: Colors.white,
                    backgroundColor: AppColors.goblin.withOpacity(0.5),
                    duration: Duration(seconds: 2),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
