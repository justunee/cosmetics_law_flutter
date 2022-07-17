import 'package:cosmetics_law/widgets/question_list_container.dart';
import 'package:flutter/material.dart';

class Status_cosme_Question extends StatefulWidget {
  final customAnswer;
  const Status_cosme_Question({Key? key, this.customAnswer}) : super(key: key);

  @override
  _Status_cosme_QuestionState createState() => _Status_cosme_QuestionState();
}

class _Status_cosme_QuestionState extends State<Status_cosme_Question> {
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
  void handleAnswer(int answer) {
    if (answer == 1) {
      widget.customAnswer(true, false, false);
    } else if (answer == 2) {
      widget.customAnswer(false, true, false);
    } else {
      widget.customAnswer(false, false, true);
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
          ),
          Card(
            child: CheckboxListTile(
              dense: true,
              value: test == 3,
              title: Text(thaiBadge[0]["thirdBox"]),
              checkboxShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              controlAffinity: ListTileControlAffinity.leading,
              onChanged: (newValue) {
                setState(() {
                  test = 3;
                });
                handleAnswer(3);
              },
            ),
          )
        ]),
      ),
    ]);
  }
}
