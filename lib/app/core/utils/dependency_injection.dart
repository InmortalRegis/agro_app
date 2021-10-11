import 'package:agro_app/app/data/providers/employee_api.dart';
import 'package:agro_app/app/data/providers/supply_api.dart';
import 'package:agro_app/app/data/repositories/employee_repository.dart';
import 'package:agro_app/app/data/repositories/supply_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class DependencyInjection {
  static void init() {
    Get.put<Dio>(Dio(BaseOptions(baseUrl: 'http://localhost:3000')));

    // providers
    // Get.put<AuthApi>(AuthApi());
    Get.put<EmployeeApi>(EmployeeApi());
    Get.put<SupplyApi>(SupplyApi());

    /// repositories
    // Get.put<AuthRepository>(AuthRepository());
    Get.put<EmployeeRepository>(EmployeeRepository());
    Get.put<SupplyRepository>(SupplyRepository());
    //controllers
    // inject authentication controller
    // Get.put<AuthController>(AuthController());
  }
}
