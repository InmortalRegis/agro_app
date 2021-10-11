import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:flutter/material.dart';

class AppDropdownLabeled extends StatelessWidget {
  final Color bgColor;
  final String label;
  final List<Map<String, String>> items;
  final Function(String?) onChanged;
  final String? selectedValue;
  const AppDropdownLabeled({
    Key? key,
    this.bgColor = AppColors.periwinkle,
    required this.label,
    required this.items,
    required this.onChanged,
    this.selectedValue,
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
              onChanged: onChanged,
              value: selectedValue,
            ),
          ),
        ],
      ),
    );
  }
}

class AppDropdownBtn extends StatelessWidget {
  final List<Map<String, String>> items;
  final Function(String?) onChanged;
  final String? value;
  const AppDropdownBtn({
    Key? key,
    required this.items,
    required this.onChanged,
    this.value,
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
      child: value != ""
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

              onChanged: onChanged,
              value: value,
              items: items
                  .map(
                    (e) => DropdownMenuItem(
                      value: e["value"],
                      child: Text(e["text"] as String),
                    ),
                  )
                  .toList(),
            )
          : Container(),
    );
  }
}
