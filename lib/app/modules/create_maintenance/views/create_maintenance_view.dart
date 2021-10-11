import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:agro_app/app/global_widgets/app_button.dart';
import 'package:agro_app/app/modules/create_maintenance/local_widgets/app_drowdown_labeled.dart';
import 'package:agro_app/app/modules/maintenance/controllers/maintenance_controller.dart';
import 'package:agro_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_maintenance_controller.dart';

class CreateMaintenanceView extends GetView<CreateMaintenanceController> {
  final _maintenanceController = Get.find<MaintenanceController>();
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
                Obx(
                  () => AppDropdownLabeled(
                    label: 'Herramienta',
                    bgColor: Colors.white,
                    selectedValue: controller.selectedTool.value,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        controller.onSelectedTool(newValue);
                      }
                    },
                    items: controller.tools
                        .map((e) => {
                              "value": e.idherramientas.toString(),
                              "text": e.heNombre,
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
                  final maintenance = {
                    "fkTrabajadorManteni": controller.selectedEmployee.value,
                    // "insuId": controller.selectedSupply.value,
                    // "idherramientas": controller.selectedTool.value,
                    // "idsubterreno": controller.selectedSubGround.value,
                  };
                  _maintenanceController.addMaintenance(maintenance);
                  Get.toNamed(Routes.MAINTENANCE);

                  Get.snackbar(
                    "Guardado",
                    "Se ha guardado correctamente",
                    icon: Icon(Icons.check, color: Colors.white),
                    snackPosition: SnackPosition.TOP,
                    colorText: Colors.white,
                    backgroundColor: AppColors.goblin,
                    duration: Duration(seconds: 2),
                  );
                  // TODO - Go to maintenance list view
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
