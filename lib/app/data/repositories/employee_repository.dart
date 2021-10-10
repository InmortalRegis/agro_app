import 'package:agro_app/app/data/model/employee.dart';
import 'package:agro_app/app/data/providers/employee_api.dart';
import 'package:get/instance_manager.dart';

class EmployeeRepository {
  final EmployeeApi _api = Get.find<EmployeeApi>();

  Future<List<Employee>?> getAllEmployees() => _api.getAllEmployees();
}
