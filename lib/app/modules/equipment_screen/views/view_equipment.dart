import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:village_rentals_system/app/data/models/equipment.dart';
import 'package:village_rentals_system/app/data/providers/data_provider.dart';
import 'package:village_rentals_system/app/modules/equipment_screen/controllers/equipment_screen_controller.dart';

class ViewEquipmentScreen extends GetView<EquipmentScreenController> {
  final int? id;
  ViewEquipmentScreen({super.key, this.id});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Equipment")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: <Widget>[
              FormBuilderDropdown(
                name: 'category',
                decoration: const InputDecoration(labelText: 'Category', border: OutlineInputBorder()),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
                items: categories
                    .map((category) => DropdownMenuItem(
                          value: category.id,
                          child: Text(category.name),
                        ))
                    .toList(),
              ),
              FormBuilderTextField(
                name: 'name',
                decoration: const InputDecoration(labelText: 'Equipment Name', border: OutlineInputBorder()),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              FormBuilderTextField(
                name: 'description',
                decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder()),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              FormBuilderTextField(
                name: 'dailyRentalCost',
                decoration: const InputDecoration(labelText: 'Daily Rental Cost', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.saveAndValidate()) {
                    var formData = _formKey.currentState!.value;
                    equipmentList.add(Equipment(
                      id: equipmentList.last.id + 1,
                      name: formData['name'],
                      description: formData['description'],
                      dailyRentalCost: double.parse(formData['dailyRentalCost']),
                      category: formData['category'],
                    ));
                    EasyLoading.showSuccess('Successfully added Equipment');
                    Get.back();
                  }
                },
                child: const Text('Add Equipment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
