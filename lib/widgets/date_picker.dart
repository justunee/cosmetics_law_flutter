import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_material_color.dart';

class DatepickerWidget extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onDateSelected;

  const DatepickerWidget({
    Key? key,
    required this.controller,
    required this.onDateSelected,
  }) : super(key: key);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      controller.text = formattedDate;
      onDateSelected(picked.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: CustomMaterialColor(228, 147, 161).mdColor,
        ),
        child: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.fromLTRB(
                10.0, 10.0, 10.0, 10.0), // left top right bottom
          ),
          readOnly: true,
          onTap: () => _selectDate(context),
        ));
  }
}
