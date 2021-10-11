import 'package:agro_app/app/data/model/supply.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class SupplyApi {
  final Dio _dio = Get.find<Dio>();

  Future<List<Supply>?> getAllSupplies() async {
    try {
      final Response response = await _dio.get('/api/insumos');
      final supplies = (response.data['insumos'] as List).map((i) {
        return Supply.fromJson(i);
      }).toList();
      return supplies;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
