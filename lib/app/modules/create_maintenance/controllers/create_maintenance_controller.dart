import 'package:agro_app/app/data/model/employee.dart';
import 'package:agro_app/app/data/model/supply.dart';
import 'package:agro_app/app/data/repositories/employee_repository.dart';
import 'package:agro_app/app/data/repositories/supply_repository.dart';
import 'package:get/get.dart';

class CreateMaintenanceController extends GetxController {
  final _employeeRepository = Get.find<EmployeeRepository>();
  final _supplyRepository = Get.find<SupplyRepository>();
  RxString selectedEmployee = "".obs;
  RxString selectedSupply = "".obs;
  String defaultValue = "";
  var toogle = false.obs;

  RxList<Employee> workers = RxList<Employee>();
  RxList<Supply> supplies = RxList<Supply>();
  @override
  void onInit() async {
    super.onInit();
    workers.value =
        await _employeeRepository.getAllEmployees() as List<Employee>;
    supplies.value = await _supplyRepository.getAllSupplies() as List<Supply>;
    print(workers);
    toogle.value = true;
    if (workers.isNotEmpty) {
      selectedEmployee.value = workers[0].trabajadorId;
    }
    if (supplies.isNotEmpty) {
      selectedSupply.value = supplies[0].insuId.toString();
    }
  }

  @override
  void onReady() async {
    super.onReady();
  }

  void onSelectedEmployee(String value) {
    selectedEmployee.value = value;
  }

  void onSelectedSupply(String value) {
    selectedSupply.value = value;
  }

  @override
  void onClose() {}
}
