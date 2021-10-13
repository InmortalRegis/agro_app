import 'package:agro_app/app/data/model/sub_ground.dart';
import 'package:agro_app/app/data/repositories/sub_ground_repository.dart';
import 'package:get/get.dart';

class CreateCropController extends GetxController {
  RxString selectedType = "1".obs;
  final _subGroundRepository = Get.find<SubGroundRepository>();
  RxList<SubGround> subGrounds = RxList<SubGround>();
  RxString selectedSubGround = "".obs;

  @override
  void onInit() async {
    super.onInit();
    subGrounds.value =
        await _subGroundRepository.getAllSubGrounds() as List<SubGround>;

    if (subGrounds.isNotEmpty) {
      selectedSubGround.value = subGrounds[0].idsubterreno.toString();
    }
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  void onSelectedType(String newVal) => selectedType.value = newVal;

  void onSelectedSubGround(String newVal) => selectedSubGround.value = newVal;
}
