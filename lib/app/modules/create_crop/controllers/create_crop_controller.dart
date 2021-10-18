import 'package:agro_app/app/data/model/crop_type.dart';
import 'package:agro_app/app/data/model/sub_ground.dart';
import 'package:agro_app/app/data/repositories/crop_repository.dart';
import 'package:agro_app/app/data/repositories/sub_ground_repository.dart';
import 'package:get/get.dart';

class CreateCropController extends GetxController {
  final _subGroundRepository = Get.find<SubGroundRepository>();
  final _cropRepository = Get.find<CropRepository>();
  RxList<SubGround> subGrounds = RxList<SubGround>();
  RxList<CropType> cropTypes = RxList<CropType>();
  RxString selectedType = "".obs;
  RxString selectedSubGround = "".obs;
  @override
  void onInit() async {
    super.onInit();
    subGrounds.value =
        await _subGroundRepository.getAllSubGrounds() as List<SubGround>;

    if (subGrounds.isNotEmpty) {
      selectedSubGround.value = subGrounds[0].idsubterreno.toString();
    }

    cropTypes.value = await _cropRepository.getAllCropTypes() as List<CropType>;

    if (cropTypes.isNotEmpty) {
      selectedType.value = cropTypes[0].idtipoCultivos.toString();
    }
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onSelectedType(String newVal) => selectedType.value = newVal;

  void onSelectedSubGround(String newVal) => selectedSubGround.value = newVal;
}
