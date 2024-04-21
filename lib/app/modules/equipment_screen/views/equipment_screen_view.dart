import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:village_rentals_system/app/data/providers/data_provider.dart';
import 'package:village_rentals_system/app/modules/equipment_screen/views/view_equipment.dart';
import 'package:village_rentals_system/app/widgets/delete_widget.dart';

import '../controllers/equipment_screen_controller.dart';

class EquipmentScreenView extends GetView<EquipmentScreenController> {
  const EquipmentScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(ViewEquipmentScreen());
                    },
                    child: Text('Add Equipment'))),
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
                          label: Text('Category'),
                        ),
                        DataColumn(
                          label: Text('Name'),
                        ),
                        DataColumn(
                          label: Text('Description'),
                        ),
                        DataColumn(
                          label: Text('Daily Rate'),
                        ),
                        DataColumn(
                          label: Text('Actions'),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                          equipmentList.length,
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
                                  DataCell(Text(equipmentList[index].id.toString())),
                                  DataCell(Text(categories.where((element) => equipmentList[index].category == element.id).first.name)),
                                  DataCell(Text(equipmentList[index].name)),
                                  DataCell(Text(equipmentList[index].description)),
                                  DataCell(Text('\$${equipmentList[index].dailyRentalCost}')),
                                  DataCell(IconButton(
                                    onPressed: () {
                                      showDeleteConfirmation(context, 'equipment', () {
                                        equipmentList.removeAt(index);
                                        EasyLoading.showToast('Deleted Equipment');
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
