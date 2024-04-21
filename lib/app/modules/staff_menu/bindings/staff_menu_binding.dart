import 'package:get/get.dart';

import '../controllers/staff_menu_controller.dart';

class StaffMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaffMenuController>(
      () => StaffMenuController(),
    );
  }
}
