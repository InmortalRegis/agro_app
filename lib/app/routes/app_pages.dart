import 'package:get/get.dart';

import 'package:agro_app/app/modules/create_maintenance/bindings/create_maintenance_binding.dart';
import 'package:agro_app/app/modules/create_maintenance/views/create_maintenance_view.dart';
import 'package:agro_app/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:agro_app/app/modules/dashboard/views/dashboard_view.dart';
import 'package:agro_app/app/modules/maintenance/bindings/maintenance_binding.dart';
import 'package:agro_app/app/modules/maintenance/views/maintenance_view.dart';
import 'package:agro_app/app/modules/onboard/bindings/onboard_binding.dart';
import 'package:agro_app/app/modules/onboard/views/onboard_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARD;

  static final routes = [
    GetPage(
      name: _Paths.ONBOARD,
      page: () => OnboardView(),
      binding: OnboardBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_MAINTENANCE,
      page: () => CreateMaintenanceView(),
      binding: CreateMaintenanceBinding(),
    ),
    GetPage(
      name: _Paths.MAINTENANCE,
      page: () => MaintenanceView(),
      binding: MaintenanceBinding(),
    ),
  ];
}
