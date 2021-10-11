import 'package:agro_app/app/data/model/maintenance.dart';
import 'package:agro_app/app/data/providers/maintenance_api.dart';
import 'package:get/instance_manager.dart';

class MaintenanceRepository {
  final MaintenanceApi _api = Get.find<MaintenanceApi>();

  Future<List<Maintenance>?> getAllMaintenances() => _api.getAllMaintenances();
}
