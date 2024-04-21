import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:village_rentals_system/app/data/providers/data_provider.dart';
import 'package:village_rentals_system/app/modules/customer_screen/controllers/customer_screen_controller.dart';
import 'package:village_rentals_system/app/modules/customer_screen/views/add_customers.dart';
import 'package:village_rentals_system/app/widgets/delete_widget.dart';

class CustomerScreenView extends GetView<CustomerScreenController> {
  const CustomerScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(AddCustomersScreen());
                    },
                    child: Text('Add Customer'))),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text('ID'),
                        ),
                        DataColumn(
                          label: Text('Last Name'),
                        ),
                        DataColumn(
                          label: Text('First Name'),
                        ),
                        DataColumn(
                          label: Text('Contact Phone'),
                        ),
                        DataColumn(
                          label: Text('Email'),
                        ),
                        DataColumn(
                          label: Text('Is Banned?'),
                        ),
                        DataColumn(
                          label: Text('Discount'),
                        ),
                        DataColumn(
                          label: Text('Actions'),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                          customers.length,
                          (int index) => DataRow(
                                color: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
                                  // All rows will have the same selected color.
                                  if (states.contains(MaterialState.selected)) {
                                    return Theme.of(context).colorScheme.primary.withOpacity(0.08);
                                  }
                                  // Even rows will have a grey color.
                                  if (index.isEven) {
                                    return Colors.grey.withOpacity(0.3);
                                  }
                                  return null; // Use default value for other states and odd rows.
                                }),
                                cells: <DataCell>[
                                  DataCell(Text(customers[index].id.toString())),
                                  DataCell(Text(customers[index].lastName)),
                                  DataCell(Text(customers[index].firstName)),
                                  DataCell(Text(customers[index].phone)),
                                  DataCell(Text(customers[index].email)),
                                  DataCell(Text(customers[index].isBanned ? 'Yes' : 'No')),
                                  DataCell(Text('${customers[index].discount}%')),
                                  DataCell(IconButton(
                                    onPressed: () async {
                                      showDeleteConfirmation(context, 'customer', () {
                                        customers.removeAt(index);
                                        EasyLoading.showToast('Deleted Customer');
                                      });
                                    },
                                    icon: Icon(Icons.delete),
                                  ))
                                ],
                              ))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
