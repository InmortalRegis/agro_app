import 'package:agro_app/app/data/model/employee.dart';
import 'package:agro_app/app/data/model/sub_ground.dart';
import 'package:agro_app/app/data/model/supply.dart';
import 'package:agro_app/app/data/model/tool.dart';
import 'package:agro_app/app/data/repositories/employee_repository.dart';
import 'package:agro_app/app/data/repositories/sub_ground_repository.dart';
import 'package:agro_app/app/data/repositories/supply_repository.dart';
import 'package:agro_app/app/data/repositories/tool_repository.dart';
import 'package:get/get.dart';

class CreateMaintenanceController extends GetxController {
  final _employeeRepository = Get.find<EmployeeRepository>();
  final _supplyRepository = Get.find<SupplyRepository>();
  final _toolRepository = Get.find<ToolRepository>();
  final _subGroundRepository = Get.find<SubGroundRepository>();
  RxString selectedEmployee = "".obs;
  RxString selectedSupply = "".obs;
  RxString selectedTool = "".obs;
  RxString selectedSubGround = "".obs;

  var toogle = false.obs;

  RxList<Employee> workers = RxList<Employee>();
  RxList<Supply> supplies = RxList<Supply>();
  RxList<Tool> tools = RxList<Tool>();
  RxList<SubGround> subGrounds = RxList<SubGround>();

  @override
  void onInit() async {
    super.onInit();
    workers.value =
        await _employeeRepository.getAllEmployees() as List<Employee>;
    supplies.value = await _supplyRepository.getAllSupplies() as List<Supply>;
    tools.value = await _toolRepository.getAllTools() as List<Tool>;
    subGrounds.value =
        await _subGroundRepository.getAllSubGrounds() as List<SubGround>;
    print(subGrounds);
    toogle.value = true;
    if (workers.isNotEmpty) {
      selectedEmployee.value = workers[0].trabajadorId;
    }
    if (supplies.isNotEmpty) {
      selectedSupply.value = supplies[0].insuId.toString();
    }
    if (tools.isNotEmpty) {
      selectedTool.value = tools[0].idherramientas.toString();
    }
    if (subGrounds.isNotEmpty) {
      selectedSubGround.value = subGrounds[0].idsubterreno.toString();
    }
  }

  @override
  void onReady() async {}

  void onSelectedEmployee(String value) {
    selectedEmployee.value = value;
  }

  void onSelectedSupply(String value) {
    selectedSupply.value = value;
  }

  void onSelectedTool(String value) {
    selectedTool.value = value;
  }

  void onSelectedSubGround(String value) {
    selectedSubGround.value = value;
  }

  @override
  void onClose() {}
}
