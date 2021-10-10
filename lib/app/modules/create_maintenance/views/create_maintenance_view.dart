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
                AppDropdownLabeled(
                  label: 'Mantenimiento',
                ),
                AppDropdownLabeled(
                  bgColor: Colors.white,
                  label: 'Trabajador',
                ),
                AppDropdownLabeled(
                  label: 'Insumos',
                ),
                AppDropdownLabeled(
                  bgColor: Colors.white,
                  label: 'Herramientas',
                ),
                AppDropdownLabeled(
                  label: 'Terreno',
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
  const AppDropdownLabeled({
    Key? key,
    this.bgColor = AppColors.periwinkle,
    required this.label,
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
            child: AppDropdownBtn(),
          ),
        ],
      ),
    );
  }
}

class AppDropdownBtn extends StatelessWidget {
  const AppDropdownBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreateMaintenanceController>();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton(
        isExpanded: true,
        value: controller.dropdownValue.value,
        icon: Icon(Icons.arrow_drop_down),
        elevation: 0,
        iconSize: 42,
        underline: SizedBox(),
        onChanged: (String? newValue) {
          controller.dropdownValue.value = newValue!;
        },
        items: ['One', 'Two', 'Three', 'Four'].map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
