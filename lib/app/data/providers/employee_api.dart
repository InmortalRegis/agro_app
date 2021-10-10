import 'package:agro_app/app/data/model/employee.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class EmployeeApi {
  final Dio _dio = Get.find<Dio>();

  Future<List<Employee>?> getAllEmployees() async {
    try {
      final Response response = await _dio.get('/api/trabajador');
      final employees = (response.data['traba'] as List).map((i) {
        return Employee.fromJson(i);
      }).toList();
      return employees;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
