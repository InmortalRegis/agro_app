import 'package:agro_app/app/data/model/employee.dart';
import 'package:agro_app/app/data/repositories/employee_repository.dart';
import 'package:get/get.dart';

class CreateMaintenanceController extends GetxController {
  final _employeeRepository = Get.find<EmployeeRepository>();
  RxString dropdownValue = "".obs;
  String defaultValue = "";
  var toogle = false.obs;

  RxList<Employee> workers = RxList<Employee>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    workers.value =
        await _employeeRepository.getAllEmployees() as List<Employee>;

    print(workers);
    toogle.value = true;
    if (workers.isNotEmpty) {
      dropdownValue.value = workers[0].trabajadorId;
    }
  }

  void onSelected(String value) {
    dropdownValue.value = value;
  }

  @override
  void onClose() {}
}
