import 'package:flutter/material.dart';

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final ValueChanged<bool> onChanged;

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

    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Checkbox(
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith(getColor),
              value: value,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              onChanged: (bool? newValue) {
                onChanged(newValue!);
              },
            ),
            Expanded(child: Text(label)),
          ],
        ),
      ),
    );
  }
}

class CheckBoxList extends StatefulWidget {
  const CheckBoxList({Key? key}) : super(key: key);

  @override
  State<CheckBoxList> createState() => _CheckBoxListState();
}

class _CheckBoxListState extends State<CheckBoxList> {
  bool _isSelected = false;

  List<String> questionlists = [
    'เลขที่รับจดแจ้ง',
    'ชื่อเครื่องสำอาง หรือ ชื่อยี่ห้อ',
    'ประเภทเครื่องสำอาง',
    'ส่วนประกอบ',
    'วิธีใช้',
    'คำเตือน',
    'ชื่อและที่อยู่ผู้ผลิต',
    'เดือน ปี ที่ผลิต / ปี เดือน ที่ผลิต (MFG)',
    'เดือน ปี ที่ผลิต / ปี เดือน ที่หมดอายุ (EXP)',
    'เลขแสดงครั้งที่ผลิต (lot no.)',
    'ปริมาตรสุทธิ'
  ];
  List<String> questionThaiLists = [
    'แสดงภาษาไทยครบทุกรายการ',
    'แสดงภาษาไทยไม่ครบทุกรายการ',
    'ไม่แสดงภาษาไทย',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: questionlists.map((String question) {
        return LabeledCheckbox(
          label: question,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: _isSelected,
          onChanged: (bool newValue) {
            setState(() {
              _isSelected = newValue;
            });
          },
        );
      }).toList(),
    );
  }
}
