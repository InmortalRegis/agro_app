import 'package:agro_app/app/data/model/maintenance.dart';
import 'package:agro_app/app/data/repositories/maintenance_repository.dart';
import 'package:get/get.dart';

class MaintenanceController extends GetxController {
  final _maintenanceRepository = Get.find<MaintenanceRepository>();
  RxList<Maintenance> maintenances = RxList<Maintenance>();
  @override
  void onInit() async {
    super.onInit();
    final mts = await _maintenanceRepository.getAllMaintenances();
    if (mts != null) {
      maintenances.value = mts;
    }
    print(maintenances);
  }

  addMaintenance(Map<String, dynamic> maintenance) {
    maintenances.add(
      Maintenance(
        idmantenimentos: maintenances.length + 1,
        maFecha: DateTime.now(),
        fkTrabajadorManteni: maintenance['fkTrabajadorManteni'],
        maDescripcion: "Descripción",
        maEstado: "Pendiente",
        fkTiposMatenimiento: 1,
      ),
    );
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
