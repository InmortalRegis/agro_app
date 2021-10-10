import 'package:agro_app/app/core/utils/helpers.dart';
import 'package:agro_app/app/core/values/app_colors.dart';
import 'package:agro_app/app/modules/dashboard/local_widgets/menu_item.dart';
import 'package:agro_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🌱🌾 Agro App'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // height: _size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 100.0,
                        // width: MediaQuery.of(context).size.width * 0.8,
                        image: AssetImage(
                          path(
                            'img/logos/logo.png',
                          ),
                        ),
                      ),
                      Text(
                        'Agro App',
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.goblin,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MenuItemCard(
                      title: 'Cultivos',
                      iconImage: path(
                        'img/icons/sprout.png',
                      ),
                      to: Routes.CREATE_MAINTENANCE,
                    ),
                  ),
                  Expanded(
                    child: MenuItemCard(
                      title: 'Mantenimiento',
                      iconImage: path(
                        'img/icons/tractor.png',
                      ),
                      to: Routes.CREATE_MAINTENANCE,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
