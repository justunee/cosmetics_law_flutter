import 'package:cosmetics_law/providers/FDAweb.dart';
import 'package:cosmetics_law/widgets/date_picker.dart';
import 'package:cosmetics_law/widgets/question_list_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Date_check_Question extends ConsumerStatefulWidget {
  final customAnswer;
  const Date_check_Question({Key? key, this.customAnswer}) : super(key: key);

  @override
  ConsumerState createState() => _Date_check_QuestionState();
}

class _Date_check_QuestionState extends ConsumerState<Date_check_Question> {
  // Generate a list of available hobbies here

  List<Map> thaiBadge = [
    {
      "question": "สถานะของใบรับจดแจ้งเป็นอย่างไร",
      "firstBox": "อนุมัติ",
      "secondBox": "เพิกถอน",
      "thirdBox": "สิ้นอายุ/ สิ้นสภาพ/ ยกเลิก",
    },
  ];
  int test = 0;
  void handleAnswer(String date, int id) {
    if (id == 1) {
      ref.read(date1Provider.notifier).update((state) => DateTime.parse(date));
      print(ref.watch(date1Provider));
    } else if (id == 2) {
      ref.read(date2Provider.notifier).update((state) => DateTime.parse(date));
      print(ref.watch(date2Provider));
    }
  }

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
          title:
              "กรุณาระบุเดือนปีที่ผลิตบนฉลาก และ วันที่เพิกถอนในใบรับจดแจ้ง"),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Text('วัน เดือน ปี ที่ผลิต บนฉลาก'),
          Container(
            child: DatepickerWidget(
              controller: TextEditingController(text: "Please select date"),
              onDateSelected: (String date) {
                handleAnswer(date, 1);
                // print(date);
              },
            ),
          ),
          SizedBox(height: 20),
          Text('วัน เดือน ปี ที่เพิกถอน ในใบรับจดแจ้ง'),
          Container(
            child: DatepickerWidget(
              controller: TextEditingController(text: "Please select date"),
              onDateSelected: (String date) {
                handleAnswer(date, 2);
                // print(date);
              },
            ),
          ),
        ]),
      ),
    ]);
  }
}
