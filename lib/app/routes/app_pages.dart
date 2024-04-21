import 'package:get/get.dart';

import '../modules/admin_menu/bindings/admin_menu_binding.dart';
import '../modules/admin_menu/views/admin_menu_view.dart';
import '../modules/customer_screen/bindings/customer_screen_binding.dart';
import '../modules/customer_screen/views/customer_screen_view.dart';
import '../modules/equipment_screen/bindings/equipment_screen_binding.dart';
import '../modules/equipment_screen/views/equipment_screen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/rental_screen/bindings/rental_screen_binding.dart';
import '../modules/rental_screen/views/rental_screen_view.dart';
import '../modules/staff_menu/bindings/staff_menu_binding.dart';
import '../modules/staff_menu/views/staff_menu_view.dart';
import '../modules/system_management/bindings/system_management_binding.dart';
import '../modules/system_management/views/system_management_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.STAFF_MENU,
      page: () => const StaffMenuView(),
      binding: StaffMenuBinding(),
    ),
    GetPage(
      name: _Paths.ADMIN_MENU,
      page: () => const AdminMenuView(),
      binding: AdminMenuBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_SCREEN,
      page: () => const CustomerScreenView(),
      binding: CustomerScreenBinding(),
    ),
    GetPage(
      name: _Paths.EQUIPMENT_SCREEN,
      page: () => const EquipmentScreenView(),
      binding: EquipmentScreenBinding(),
    ),
    GetPage(
      name: _Paths.RENTAL_SCREEN,
      page: () => RentalScreenView(),
      binding: RentalScreenBinding(),
    ),
    GetPage(
      name: _Paths.SYSTEM_MANAGEMENT,
      page: () => const SystemManagementView(),
      binding: SystemManagementBinding(),
    ),
  ];
}
