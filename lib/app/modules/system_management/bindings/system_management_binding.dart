import 'package:get/get.dart';

import '../controllers/system_management_controller.dart';

class SystemManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SystemManagementController>(
      () => SystemManagementController(),
    );
  }
}
