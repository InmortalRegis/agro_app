import 'package:get/get.dart';

import '../controllers/create_crop_controller.dart';

class CreateCropBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateCropController>(
      () => CreateCropController(),
    );
  }
}
