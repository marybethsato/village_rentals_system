import 'package:get/get.dart';

import '../controllers/equipment_screen_controller.dart';

class EquipmentScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EquipmentScreenController>(
      () => EquipmentScreenController(),
    );
  }
}
