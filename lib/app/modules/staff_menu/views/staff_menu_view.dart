import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:village_rentals_system/app/widgets/menu.dart';

import '../controllers/staff_menu_controller.dart';

class StaffMenuView extends GetView<StaffMenuController> {
  const StaffMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StaffMenuView'),
        centerTitle: true,
      ),
      body: Center(child: MenuWidget()
      ),
    );
  }
}
