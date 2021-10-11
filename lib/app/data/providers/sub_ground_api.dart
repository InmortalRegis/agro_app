import 'package:agro_app/app/data/model/sub_ground.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class SubGroundApi {
  final Dio _dio = Get.find<Dio>();

  Future<List<SubGround>?> getAllSubGrounds() async {
    try {
      final Response response = await _dio.get('/api/subterrenos');
      final subGrounds = (response.data['terreno'] as List).map((i) {
        return SubGround.fromJson(i);
      }).toList();
      return subGrounds;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
