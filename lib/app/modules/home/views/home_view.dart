import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:village_rentals_system/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: Size.infinite.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'VILLAGE RENTALS SYSTEM',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.ADMIN_MENU);
                },
                child: Text('Login as Admin')),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.STAFF_MENU);
                },
                child: Text('Login as Staff')),
          ],
        ),
      ),
    );
  }
}
