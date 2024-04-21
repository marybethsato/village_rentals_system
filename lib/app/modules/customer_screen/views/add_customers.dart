import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:village_rentals_system/app/data/models/customer.dart';
import 'package:village_rentals_system/app/data/providers/data_provider.dart';

class AddCustomersScreen extends StatelessWidget {
  AddCustomersScreen({super.key});
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Customer")),
      body: SingleChildScrollView(
        primary: false,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: <Widget>[
                FormBuilderTextField(
                  name: 'lastName',
                  decoration: InputDecoration(labelText: 'Last Name', border: OutlineInputBorder()),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                FormBuilderTextField(
                  name: 'firstName',
                  decoration: InputDecoration(labelText: 'First Name', border: OutlineInputBorder()),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                FormBuilderTextField(
                  name: 'phone',
                  decoration: InputDecoration(labelText: 'Phone', border: OutlineInputBorder()),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                FormBuilderTextField(
                  name: 'email',
                  decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder()),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                FormBuilderSwitch(
                  name: 'isBanned',
                  title: Text('Is Banned'),
                  initialValue: false,
                ),
                FormBuilderSlider(
                  name: 'discount',
                  decoration: InputDecoration(labelText: 'Discount', border: OutlineInputBorder()),
                  min: 0.0,
                  max: 100.0,
                  initialValue: 0.0,
                  divisions: 100,
                  label: "Discount",
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.saveAndValidate()) {
                      var formData = _formKey.currentState!.value;
                      customers.add(Customer(
                        id: customers.last.id + 1,
                        lastName: formData['lastName'],
                        firstName: formData['firstName'],
                        phone: formData['phone'],
                        email: formData['email'],
                        isBanned: formData['isBanned'],
                        discount: (formData['discount'] as double).toInt(),
                      ));
                      EasyLoading.showSuccess('Successfully created Customer');
                      Get.back();
                    }
                  },
                  child: Text('Add Customer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
