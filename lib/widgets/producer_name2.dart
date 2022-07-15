import 'package:cosmetics_law/widgets/question_list_container.dart';
import 'package:flutter/material.dart';

class Producer_name2_Question extends StatefulWidget {
  final customAnswer;
  const Producer_name2_Question({Key? key, this.customAnswer})
      : super(key: key);

  @override
  _Producer_name2_QuestionState createState() =>
      _Producer_name2_QuestionState();
}

class _Producer_name2_QuestionState extends State<Producer_name2_Question> {
  // Generate a list of available hobbies here
  List<Map> thaiBadge = [
    {
      "question": "พบชื่อผู้ผลิต/ผู้นำเข้านี้ในระบบหรือไม่",
      "firstBox": "พบผู้ผลิต/นำเข้านี้ในระบบ",
      "secondBox": "ไ่ม่พบผู้ผลิต/นำเข้านี้ในระบบ",
    },
  ];
  int test = 0;
  void handleAnswer(int answer) {
    if (answer == 1) {
      widget.customAnswer(true, false);
    } else {
      widget.customAnswer(false, true);
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
        title: thaiBadge[0]["question"],
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Card(
            child: CheckboxListTile(
              dense: true,
              value: test == 1,
              title: Text(thaiBadge[0]["firstBox"]),
              checkboxShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (newValue) {
                setState(() {
                  test = 1;
                });
                handleAnswer(1);
              },
            ),
          ),
          Card(
            child: CheckboxListTile(
              dense: true,
              value: test == 2,
              title: Text(thaiBadge[0]["secondBox"]),
              checkboxShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (newValue) {
                setState(() {
                  test = 2;
                });
                handleAnswer(2);
              },
            ),
          )
        ]),
      ),
    ]);
  }
}
