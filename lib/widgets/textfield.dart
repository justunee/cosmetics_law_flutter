// simple text field

import 'package:flutter/material.dart';

import 'custom_material_color.dart';

class Textfield extends StatelessWidget {
  final TextEditingController controller;

  const Textfield({
    Key? key,
    required this.controller,
  }) : super(key: key);

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
        ));
  }
}
