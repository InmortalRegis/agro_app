import 'package:agro_app/app/data/model/supply.dart';
import 'package:agro_app/app/data/providers/supply_api.dart';
import 'package:get/instance_manager.dart';

class SupplyRepository {
  final SupplyApi _api = Get.find<SupplyApi>();

  Future<List<Supply>?> getAllSupplies() => _api.getAllSupplies();
}
