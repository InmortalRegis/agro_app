import 'package:agro_app/app/data/model/tool.dart';
import 'package:dio/dio.dart';
import 'package:get/instance_manager.dart';

class ToolApi {
  final Dio _dio = Get.find<Dio>();

  Future<List<Tool>?> getAllTools() async {
    try {
      final Response response = await _dio.get('/api/herramientas');
      final tools = (response.data['herramienta'] as List).map((i) {
        return Tool.fromJson(i);
      }).toList();
      return tools;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
