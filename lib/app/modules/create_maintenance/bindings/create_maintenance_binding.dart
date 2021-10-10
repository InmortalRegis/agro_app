import 'package:get/get.dart';

import '../controllers/create_maintenance_controller.dart';

class CreateMaintenanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateMaintenanceController>(
      () => CreateMaintenanceController(),
    );
  }
}
