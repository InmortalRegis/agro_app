import 'package:agro_app/app/data/model/sub_ground.dart';
import 'package:agro_app/app/data/providers/sub_ground_api.dart';
import 'package:get/instance_manager.dart';

class SubGroundRepository {
  final SubGroundApi _api = Get.find<SubGroundApi>();

  Future<List<SubGround>?> getAllSubGrounds() => _api.getAllSubGrounds();
}
