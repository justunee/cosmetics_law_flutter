import 'package:cosmetics_law/widgets/question_list_container.dart';
import 'package:flutter/material.dart';

class New_Born_Question extends StatefulWidget {
  final customAnswer;
  const New_Born_Question({Key? key, this.customAnswer}) : super(key: key);

  @override
  _New_Born_QuestionState createState() => _New_Born_QuestionState();
}

class _New_Born_QuestionState extends State<New_Born_Question> {
  // Generate a list of available hobbies here
  List<Map> thaiBadge = [
    {
      "question":
          "ผลิตภัณฑ์นี้เป็นผลิตภัณฑ์ที่ใช้บริเวณรอบดวงตา เยื่อบุอ่อน หรือใช้กับเด็กที่อายุ < 3 ปี หรือไม่ ",
      "firstBox": "ใช่",
      "secondBox": "ไม่ใช่",
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
