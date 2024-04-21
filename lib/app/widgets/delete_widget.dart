import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showDeleteConfirmation(BuildContext context, String name, VoidCallback onDelete) {
  Get.dialog(
    AlertDialog(
      title: const Text('Confirm Delete'),
      content: Text('Are you sure you want to delete this $name?'),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Get.back(); // Close the dialog
          },
        ),
        TextButton(
          child: const Text('Delete'),
          onPressed: () {
            onDelete(); // Perform the delete operation
            Get.back(); // Close the dialog
          },
        ),
      ],
    ),
    barrierDismissible: false, // User must tap button to close dialog
  );
}