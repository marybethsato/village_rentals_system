import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:village_rentals_system/app/data/models/category.dart';
import 'package:village_rentals_system/app/data/providers/data_provider.dart';

class AddCategories extends StatelessWidget {
  AddCategories({super.key});

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Category")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: <Widget>[
              FormBuilderTextField(
                name: 'name',
                decoration: const InputDecoration(labelText: 'Category Name', border: OutlineInputBorder()),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              ElevatedButton(
                onPressed: () {

                  if (_formKey.currentState!.saveAndValidate()) {
                    var formData = _formKey.currentState!.value;
                    categories.add(Category(
                      id: categories.last.id + 10,
                      name: formData['name'],
                    ));
                    Get.back();
                    EasyLoading.showSuccess('Successfully added Category');
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
