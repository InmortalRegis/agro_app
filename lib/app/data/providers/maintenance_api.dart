import 'package:agro_app/app/data/model/maintenance.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class MaintenanceApi {
  final Dio _dio = Get.find<Dio>();

  Future<List<Maintenance>?> getAllMaintenances() async {
    try {
      final Response response = await _dio.get('/api/mantenimiento');
      print(response.data);
      final maintenances = (response.data['mantenimiento'] as List).map((i) {
        return Maintenance.fromJson(i);
      }).toList();
      print(maintenances);
      return maintenances;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
