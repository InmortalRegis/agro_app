import 'package:agro_app/app/data/model/crop_type.dart';
import 'package:agro_app/app/data/providers/crop_api.dart';
import 'package:get/instance_manager.dart';

class CropRepository {
  final CropApi _api = Get.find<CropApi>();

  Future<List<CropType>?> getAllCropTypes() => _api.getAllCropTypes();
}
