import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:village_rentals_system/app/data/providers/data_provider.dart';
import 'package:village_rentals_system/app/modules/rental_screen/controllers/rental_screen_controller.dart';
import 'package:village_rentals_system/app/modules/rental_screen/views/add_rental.dart';
import 'package:village_rentals_system/app/widgets/delete_widget.dart';

class RentalScreenView extends GetView<RentalScreenController> {
  const RentalScreenView({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rentals'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(AddRentalView());
                    },
                    child: Text('New Rent'))),
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
                          label: Text('Date'),
                        ),
                        DataColumn(
                          label: Text('Customer ID'),
                        ),
                        DataColumn(
                          label: Text('Equipment ID'),
                        ),
                        DataColumn(
                          label: Text('Rental Date'),
                        ),
                        DataColumn(
                          label: Text('Return Date'),
                        ),
                        DataColumn(
                          label: Text('Cost'),
                        ),
                        DataColumn(
                          label: Text('Action'),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                          rentals.length,
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
                                  DataCell(Text(rentals[index].id.toString())),
                                  DataCell(Text(DateFormat.yMMMd().format(rentals[index].currentDate))),
                                  DataCell(Text(rentals[index].customerID.toString())),
                                  DataCell(Text(rentals[index].equipmentID.toString())),
                                  DataCell(Text(DateFormat.yMMMd().format(rentals[index].rentalDate))),
                                  DataCell(Text(DateFormat.yMMMd().format(rentals[index].returnDate))),
                                  DataCell(Text('\$${rentals[index].cost}')),
                                  DataCell(IconButton(
                                    onPressed: () {
                                      showDeleteConfirmation(context, 'rental data', () {
                                        rentals.removeAt(index);
                                        EasyLoading.showToast('Deleted Rental');
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
