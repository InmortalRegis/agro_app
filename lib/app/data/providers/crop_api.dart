import 'package:agro_app/app/data/model/crop_type.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class CropApi {
  final Dio _dio = Get.find<Dio>();

  Future<List<CropType>?> getAllCropTypes() async {
    try {
      final Response response = await _dio.get('/api/tipocultivo');
      final types = (response.data['tcultivos'] as List).map((i) {
        return CropType.fromJson(i);
      }).toList();
      return types;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
