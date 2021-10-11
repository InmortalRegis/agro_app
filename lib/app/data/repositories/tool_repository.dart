import 'package:agro_app/app/data/model/tool.dart';
import 'package:agro_app/app/data/providers/tool_api.dart';
import 'package:get/instance_manager.dart';

class ToolRepository {
  final ToolApi _api = Get.find<ToolApi>();

  Future<List<Tool>?> getAllTools() => _api.getAllTools();
}
