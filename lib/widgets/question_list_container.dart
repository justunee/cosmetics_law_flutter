import 'package:cosmetics_law/widgets/custom_material_color.dart';
import 'package:flutter/material.dart';

class question_list_container extends StatelessWidget {
  String title = "";
  question_list_container({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        // minHeight: 500, //minimum height
        minWidth: 335, // minimum width

        // maxHeight: MediaQuery.of(context).size.height,
        // //maximum height set to 100% of vertical height

        // maxWidth: MediaQuery.of(context).size.width,
        // //maximum width set to 100% of width
      ),
      padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
      margin: EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
      decoration: BoxDecoration(
        color: CustomMaterialColor(228, 147, 161).mdColor.shade400,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: 'Sukhumvit Set',
        ),
      ),
    );
  }
}
