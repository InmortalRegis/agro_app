import 'package:agro_app/app/data/providers/employee_api.dart';
import 'package:agro_app/app/data/providers/maintenance_api.dart';
import 'package:agro_app/app/data/providers/sub_ground_api.dart';
import 'package:agro_app/app/data/providers/supply_api.dart';
import 'package:agro_app/app/data/providers/tool_api.dart';
import 'package:agro_app/app/data/repositories/employee_repository.dart';
import 'package:agro_app/app/data/repositories/maintenance_repository.dart';
import 'package:agro_app/app/data/repositories/sub_ground_repository.dart';
import 'package:agro_app/app/data/repositories/supply_repository.dart';
import 'package:agro_app/app/data/repositories/tool_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.put<Dio>(
        Dio(BaseOptions(baseUrl: 'https://app-agro-back.herokuapp.com')));

    // providers
    // Get.put<AuthApi>(AuthApi());
    Get.put<EmployeeApi>(EmployeeApi());
    Get.put<SupplyApi>(SupplyApi());
    Get.put<ToolApi>(ToolApi());
    Get.put<SubGroundApi>(SubGroundApi());
    Get.put<MaintenanceApi>(MaintenanceApi());

    /// repositories
    // Get.put<AuthRepository>(AuthRepository());
    Get.put<EmployeeRepository>(EmployeeRepository());
    Get.put<SupplyRepository>(SupplyRepository());
    Get.put<ToolRepository>(ToolRepository());
    Get.put<SubGroundRepository>(SubGroundRepository());
    Get.put<MaintenanceRepository>(MaintenanceRepository());

    //controllers
    // inject authentication controller
    // Get.put<AuthController>(AuthController());
  }
}
