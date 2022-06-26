import 'package:cosmetics_law/widgets/custom_material_color.dart';
import 'package:cosmetics_law/widgets/question_list_container.dart';
import 'package:flutter/material.dart';

class CheckboxBadge extends StatefulWidget {
  const CheckboxBadge({Key? key}) : super(key: key);

  @override
  _CheckboxBadgeState createState() => _CheckboxBadgeState();
}

class _CheckboxBadgeState extends State<CheckboxBadge> {
  // Generate a list of available hobbies here
  List<Map> badgeChecklists = [
    {"question": "เลขที่รับจดแจ้ง", "isChecked": false},
    {"question": "ชื่อเครื่องสำอาง หรือ ชื่อยี่ห้อ", "isChecked": false},
    {"question": "ประเภทเครื่องสำอาง", "isChecked": false},
    {"question": "ส่วนประกอบ", "isChecked": false},
    {"question": "วิธีใช้", "isChecked": false},
    {"question": "คำเตือน", "isChecked": false},
    {"question": "ชื่อและที่อยู่ผู้ผลิต", "isChecked": false},
    {
      "question": "เดือน ปี ที่ผลิต / ปี เดือน ที่ผลิต (MFG)",
      "isChecked": false
    },
    {
      "question": "เดือน ปี ที่ผลิต / ปี เดือน ที่หมดอายุ (EXP)",
      "isChecked": false
    },
    {"question": "เลขแสดงครั้งที่ผลิต (lot no.)", "isChecked": false},
    {"question": "ปริมาตรสุทธิ", "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      question_list_container(title: "รายการใดที่ไม่พบบนฉลาก"),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            children: badgeChecklists.map((badge) {
          return Card(
            child: Container(
              height: 24,
              child: CheckboxListTile(
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
                },
              ),
            ),
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
          return Container(
            height: 24,
            child: CheckboxListTile(
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
            ),
          );
        }).toList()),
      ),
    ]);
  }
}
