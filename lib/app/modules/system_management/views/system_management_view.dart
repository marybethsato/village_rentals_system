import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:village_rentals_system/app/data/providers/data_provider.dart';
import 'package:village_rentals_system/app/modules/system_management/views/add_categories.dart';
import 'package:village_rentals_system/app/widgets/delete_widget.dart';

import '../controllers/system_management_controller.dart';

class SystemManagementView extends GetView<SystemManagementController> {
  const SystemManagementView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(AddCategories());
                    },
                    child: Text('Add Category'))),
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
                          label: Text('Name'),
                        ),
                        DataColumn(
                          label: Text('Actions'),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                          categories.length,
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
                                  DataCell(Text(categories[index].id.toString())),
                                  DataCell(Text(categories[index].name)),
                                  DataCell(IconButton(
                                    onPressed: () {
                                      showDeleteConfirmation(context, 'category', () {
                                        categories.removeAt(index);
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
