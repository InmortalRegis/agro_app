import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_maintenance_controller.dart';

class CreateMaintenanceView extends GetView<CreateMaintenanceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CreateMaintenanceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CreateMaintenanceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
