import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:agro_app/app/global_widgets/app_button.dart';
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
                // AppDropdownLabeled(
                //   label: 'Insumos',
                //   items: [
                //     {"value": "1", "text": "One"}
                //   ],
                // ),
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

class AppDropdownLabeled extends StatelessWidget {
  final Color bgColor;
  final String label;
  final List<Map<String, String>> items;
  const AppDropdownLabeled({
    Key? key,
    this.bgColor = AppColors.periwinkle,
    required this.label,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor.withOpacity(0.3),
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.valhalla,
              fontSize: 18,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: AppDropdownBtn(
              items: items,
            ),
          ),
        ],
      ),
    );
  }
}

class AppDropdownBtn extends StatelessWidget {
  final List<Map<String, String>> items;
  const AppDropdownBtn({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<CreateMaintenanceController>();
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: GetBuilder<CreateMaintenanceController>(
          initState: (_) {},
          builder: (controller) {
            return controller.toogle.value
                ? DropdownButton(
                    // isExpanded: true,
                    hint: Text(
                      'Seleccione una opción',
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.valhalla,
                      ),
                    ),

                    icon: Icon(Icons.arrow_drop_down),
                    elevation: 0,
                    iconSize: 42,
                    underline: SizedBox(),

                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        controller.onSelected(newValue);
                      }
                    },
                    value: controller.dropdownValue.value,
                    items: items
                        .map(
                          (e) => DropdownMenuItem(
                            value: e["value"],
                            child: Text(e["text"] as String),
                          ),
                        )
                        .toList(),
                  )
                : Container();
          },
        ));
  }
}
