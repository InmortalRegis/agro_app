import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:agro_app/app/global_widgets/app_button.dart';
import 'package:agro_app/app/modules/create_maintenance/local_widgets/app_drowdown_labeled.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_maintenance_controller.dart';

class CreateMaintenanceView extends GetView<CreateMaintenanceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear mantenimiento'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(
          bottom: 20.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // AppDropdownLabeled(
                //   label: 'Mantenimiento',
                //   items: [
                //     {"value": "1", "text": "One"}
                //   ],
                // ),
                Obx(
                  () => AppDropdownLabeled(
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        controller.onSelectedEmployee(newValue);
                      }
                    },
                    selectedValue: controller.selectedEmployee.value,
                    bgColor: Colors.white,
                    label: 'Trabajador',
                    items: controller.workers
                        .map((e) => {
                              "value": e.trabajadorId,
                              "text": e.tNombre,
                            })
                        .toList(),
                  ),
                ),
                Obx(
                  () => AppDropdownLabeled(
                    label: 'Insumos',
                    selectedValue: controller.selectedSupply.value,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        controller.onSelectedSupply(newValue);
                      }
                    },
                    items: controller.supplies
                        .map((e) => {
                              "value": e.insuId.toString(),
                              "text": e.inNombre,
                            })
                        .toList(),
                  ),
                ),
                // AppDropdownLabeled(
                //   bgColor: Colors.white,
                //   label: 'Herramientas',
                //   items: [
                //     {"value": "1", "text": "One"}
                //   ],
                // ),
                // AppDropdownLabeled(
                //   label: 'Terreno',
                //   items: [
                //     {"value": "1", "text": "One"}
                //   ],
                // ),
              ],
            ),
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
                  print('Save!');
                  Get.snackbar(
                    "Guardado",
                    "Se ha guardado correctamente",
                    icon: Icon(Icons.check, color: Colors.white),
                    snackPosition: SnackPosition.TOP,
                    colorText: Colors.white,
                    backgroundColor: AppColors.goblin,
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
