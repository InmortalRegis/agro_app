import 'package:agro_app/app/data/model/crop.dart';
import 'package:agro_app/app/data/repositories/crop_repository.dart';
import 'package:get/get.dart';

class CropsController extends GetxController {
  final _cropRepository = Get.find<CropRepository>();

  RxList<Crop> crops = <Crop>[].obs;
  @override
  void onInit() async {
    super.onInit();

    crops.value = await _cropRepository.getCrops() as List<Crop>;

    print(crops);
  }

  @override
  void onReady() {}

  @override
  void onClose() {}

  addCrop(Map<String, dynamic> cropInput) {
    print(cropInput);
    crops.add(
      Crop(
          fecha: cropInput['fecha'],
          fkTipoCultivos: int.parse(cropInput['fkTipoCultivos']),
          fkSubterreno: int.parse(cropInput['fkSubterreno']),
          idSubterrenoHasTipoCultivoscol:
              cropInput['idSubterrenoHasTipoCultivoscol']),
    );
  }
}
