import 'package:cosmetics_law/providers/badgeChecklist.dart';
import 'package:cosmetics_law/providers/badgeThaiChecklist.dart';
import 'package:cosmetics_law/widgets/question_list_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckboxBadge extends ConsumerStatefulWidget {
  const CheckboxBadge({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _CheckboxBadgeState();
}

void _onChanged(int value, bool isChecked) {
  print(value);
  print(isChecked);
}

class _CheckboxBadgeState extends ConsumerState<CheckboxBadge> {
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
    dynamic data = ref.watch(BadgeChecklistsProvider).checklist;

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

              ref
                  .read(BadgeChecklistsProvider.notifier)
                  .answer(badge["id"].toString(), badge["isChecked"]);

              // print(data.checklist['1']);
            },
          );
        }).toList()),
      ),
    ]);
  }
}

class CheckboxThaiBadge extends ConsumerStatefulWidget {
  const CheckboxThaiBadge({Key? key}) : super(key: key);

  @override
  ConsumerState createState() => _CheckboxThaiBadgeState();
}

class _CheckboxThaiBadgeState extends ConsumerState<CheckboxThaiBadge> {
  // Generate a list of available hobbies here
  List<Map> thaiBadge = [
    {"question": "แสดงภาษาไทยครบทุกรายการ", "isChecked": false, "id": 1},
    {"question": "แสดงภาษาไทยไม่ครบทุกรายการ", "isChecked": false, "id": 2},
    {"question": "ไม่แสดงภาษาไทย", "isChecked": false, "id": 3},
  ];

  // String title = "";

  @override
  Widget build(BuildContext context) {
    dynamic data = ref.watch(BadgeThaiChecklistsProvider).checklist;

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
          title: "รายการบนฉลากข้างต้นมีการแสดงภาษาไทยหรือไม่"),
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
              ref
                  .read(BadgeThaiChecklistsProvider.notifier)
                  .answer(badge["id"].toString(), badge["isChecked"]);
            },
          );
        }).toList()),
      ),
    ]);
  }
}
