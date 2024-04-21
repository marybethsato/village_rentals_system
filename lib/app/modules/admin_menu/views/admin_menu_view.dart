import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:village_rentals_system/app/widgets/menu.dart';

import '../controllers/admin_menu_controller.dart';

class AdminMenuView extends GetView<AdminMenuController> {
  const AdminMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Administrator'),
        centerTitle: true,
      ),
      body: const Center(child: MenuWidget(isAdmin: true)),
    );
  }
}
