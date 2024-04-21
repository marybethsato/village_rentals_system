import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:village_rentals_system/app/data/models/rental.dart';
import 'package:village_rentals_system/app/data/providers/data_provider.dart';

import '../controllers/rental_screen_controller.dart';

class AddRentalView extends GetView<RentalScreenController> {
  AddRentalView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormBuilderState>();
  DateTime? rental;
  DateTime? returnDate;
  int? equipmentID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Rental")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StatefulBuilder(builder: (context, setState) {
          return FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  FormBuilderDropdown(
                    name: 'customerID',
                    decoration: InputDecoration(labelText: 'Select Customer', border: OutlineInputBorder()),
                    items: customers.where((p0) => p0.isBanned == false)
                        .map((customer) => DropdownMenuItem(
                              value: customer.id,
                              child: Text('${customer.firstName} ${customer.lastName}'),
                            ))
                        .toList(),
                    onChanged: (value) {
                      // Optionally update UI to show selected customer details
                    },
                  ),
                  FormBuilderDropdown(
                    name: 'equipmentID',
                    decoration: InputDecoration(labelText: 'Select Equipment', border: OutlineInputBorder()),
                    items: equipmentList
                        .map((equipment) => DropdownMenuItem(
                              value: equipment.id,
                              child: Text(equipment.name),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        equipmentID = value;
                      });
                    },
                  ),
                  FormBuilderDateTimePicker(
                    name: 'rentalDate',
                    decoration: InputDecoration(labelText: 'Rental Date', border: OutlineInputBorder()),
                    initialEntryMode: DatePickerEntryMode.calendar,
                    initialValue: DateTime.now(),
                    onChanged: (val) {
                      setState(() {
                        rental = val;
                      });
                    },
                  ),
                  FormBuilderDateTimePicker(
                    name: 'returnDate',
                    decoration: InputDecoration(labelText: 'Return Date', border: OutlineInputBorder()),
                    initialEntryMode: DatePickerEntryMode.calendar,
                    initialValue: DateTime.now().add(Duration(days: 1)),
                    onChanged: (val) {
                      setState(() {
                        returnDate = val;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Cost'),
                        Builder(builder: (context) {
                          if (rental != null && returnDate != null && equipmentID != null) {
                            int days = returnDate!.difference(rental!).inDays;
                            double cost = equipmentList.where((p0) => p0.id == equipmentID).first.dailyRentalCost;
                            return Text('\$${cost * days}');
                          } else {
                            return Text('\$0.00');
                          }
                        })
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        var formData = _formKey.currentState!.value;
                        int days = returnDate!.difference(rental!).inDays;
                        double cost = equipmentList.where((p0) => p0.id == equipmentID).first.dailyRentalCost * days;

                        rentals.add(Rental(
                            id: rentals.last.id + 1,
                            currentDate: DateTime.now(),
                            customerID: formData['customerID'],
                            equipmentID: formData['equipmentID'],
                            rentalDate: formData['rentalDate'],
                            returnDate: formData['returnDate'],
                            cost: cost));
                        EasyLoading.showSuccess('Successfully rented to customer');
                        Get.back();
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
