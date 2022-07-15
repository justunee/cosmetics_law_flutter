import 'package:cosmetics_law/widgets/custom_material_color.dart';
import 'package:cosmetics_law/widgets/question_list_container.dart';
import 'package:flutter/material.dart';

class CheckboxBadge extends StatefulWidget {
  const CheckboxBadge({Key? key}) : super(key: key);

  @override
  _CheckboxBadgeState createState() => _CheckboxBadgeState();
}

void _onChanged(List value) {
  print(value);
}

class _CheckboxBadgeState extends State<CheckboxBadge> {
  // Generate a list of available hobbies here
  List<Map> badgeChecklists = [
    {"question": "เลขที่รับจดแจ้ง", "isChecked": false, "id": 1},
    {
      "question": "ชื่อเครื่องสำอาง หรือ ชื่อยี่ห้อ",
      "isChecked": false,
      "id": 2
    },
    {"question": "ประเภทเครื่องสำอาง", "isChecked": false, "id": 3},
    {"question": "ส่วนประกอบ", "isChecked": false, "id": 4},
    {"question": "วิธีใช้", "isChecked": false, "id": 5},
    {"question": "คำเตือน", "isChecked": false, "id": 6},
    {"question": "ชื่อและที่อยู่ผู้ผลิต", "isChecked": false, "id": 7},
    {
      "question": "เดือน ปี ที่ผลิต / ปี เดือน ที่ผลิต (MFG)",
      "isChecked": false,
      "id": 8
    },
    {
      "question": "เดือน ปี ที่ผลิต / ปี เดือน ที่หมดอายุ (EXP)",
      "isChecked": false,
      "id": 9
    },
    {"question": "เลขแสดงครั้งที่ผลิต (lot no.)", "isChecked": false, "id": 10},
    {"question": "ปริมาตรสุทธิ", "isChecked": false, "id": 11},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      question_list_container(title: "รายการใดที่ไม่พบบนฉลาก"),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            children: badgeChecklists.map((badge) {
          return CheckboxListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            value: badge["isChecked"],
            title: Text(badge["question"]),
            checkboxShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (newValue) {
              setState(() {
                badge["isChecked"] = newValue;
              });
              _onChanged(badgeChecklists);
            },
          );
        }).toList()),
      ),
    ]);
  }
}

class CheckboxThaiBadge extends StatefulWidget {
  const CheckboxThaiBadge({Key? key}) : super(key: key);

  @override
  _CheckboxThaiBadgeState createState() => _CheckboxThaiBadgeState();
}

class _CheckboxThaiBadgeState extends State<CheckboxThaiBadge> {
  // Generate a list of available hobbies here
  List<Map> thaiBadge = [
    {"question": "แสดงภาษาไทยครบทุกรายการ", "isChecked": false},
    {"question": "แสดงภาษาไทยไม่ครบทุกรายการ", "isChecked": false},
    {"question": "ไม่แสดงภาษาไทย", "isChecked": false},
  ];

  // String title = "";

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.yellow;
    }

    return Column(children: [
      question_list_container(
          title: "รายการบนฉลากข้างต้นมีการแสดงภาษาไทยหรือไม"),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            children: thaiBadge.map((badge) {
          return CheckboxListTile(
            dense: true,
            value: badge["isChecked"],
            title: Text(badge["question"]),
            checkboxShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (newValue) {
              setState(() {
                badge["isChecked"] = newValue;
              });
            },
          );
        }).toList()),
      ),
    ]);
  }
}
