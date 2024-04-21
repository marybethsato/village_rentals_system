import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:to_csv/to_csv.dart' as exportCSV;
import 'package:village_rentals_system/app/data/models/customer.dart';
import 'package:village_rentals_system/app/data/models/equipment.dart';
import 'package:village_rentals_system/app/data/models/rental.dart';
import 'package:village_rentals_system/app/data/providers/data_provider.dart';
import 'package:village_rentals_system/app/routes/app_pages.dart';

class MenuWidget extends StatelessWidget {
  final bool isAdmin;
  const MenuWidget({super.key, this.isAdmin = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.EQUIPMENT_SCREEN);
            },
            child: Text('Equipment Inventory Management')),
        ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.RENTAL_SCREEN);
            },
            child: Text('Equipment Rental Process')),
        ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.CUSTOMER_SCREEN);
            },
            child: Text('Customer Information Management')),
        if (isAdmin)
          ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.SYSTEM_MANAGEMENT);
              },
              child: Text('System Management')),
        ElevatedButton(
            onPressed: () async {
              try {
                List<List<String>> listOfListsC = [];
                List<List<String>> listOfListsE = [];
                List<List<String>> listOfListsR = [];
                for (Customer customer in customers) {
                  listOfListsC.add(customer.toList());
                }
                for (Rental rental in rentals) {
                  listOfListsR.add(rental.toList());
                }
                for (Equipment e in equipmentList) {
                  listOfListsE.add(e.toList());
                }
                await EasyLoading.show(status: 'Generating customer report...');
                await exportCSV.myCSV(customerHeaders, listOfListsC, fileName: 'customers_report');
                await EasyLoading.show(status: 'Generating equipment report...');
                await exportCSV.myCSV(equipmentHeaders, listOfListsE, fileName: 'equipment_report');
                await EasyLoading.show(status: 'Generating rental report...');
                await exportCSV.myCSV(rentalHeaders, listOfListsR, fileName: 'rental_report');
                EasyLoading.showSuccess('Successfully generated reports');
              } catch (e) {
                await EasyLoading.showError("Error generating report: ${e}");
              } finally {
                await EasyLoading.dismiss();
              }
            },
            child: Text('Generate Reports')),
      ],
    );
  }
}
