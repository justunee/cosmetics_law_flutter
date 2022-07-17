import 'package:cosmetics_law/providers/FDAweb.dart';
import 'package:cosmetics_law/widgets/date_picker.dart';
import 'package:cosmetics_law/widgets/question_list_container.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Date2_check_Question extends ConsumerStatefulWidget {
  final customAnswer;
  const Date2_check_Question({Key? key, this.customAnswer}) : super(key: key);

  @override
  ConsumerState createState() => _Date2_check_QuestionState();
}

class _Date2_check_QuestionState extends ConsumerState<Date2_check_Question> {
  // Generate a list of available hobbies here
  void handleAnswer(String date, int id) {
    if (id == 1) {
      ref.read(date3Provider.notifier).update((state) => DateTime.parse(date));
      print(ref.watch(date3Provider));
    } else if (id == 2) {
      ref.read(date4Provider.notifier).update((state) => DateTime.parse(date));
      print(ref.watch(date4Provider));
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
              "กรุณาระบุ เดือนปีที่ผลิตในฉลาก และ วันที่สิ้นอายุ/ สิ้นสภาพ/ ยกเลิกในใบรับจดแจ้ง"),
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
          Text('วัน เดือน ปี ที่สิ้นอายุ/สิ้นสภาพ/ยกเลิก ในใบรับจดแจ้ง'),
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
