import 'package:cosmetics_law/widgets/question_list_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TrueFalseQuestion extends StatefulWidget {
  final customAnswer;
  const TrueFalseQuestion({Key? key, this.customAnswer}) : super(key: key);

  @override
  _TrueFalseQuestionState createState() => _TrueFalseQuestionState();
}

class _TrueFalseQuestionState extends State<TrueFalseQuestion> {
  // Generate a list of available hobbies here
  List<Map> thaiBadge = [
    {
      "question":
          "บนฉลากมีข้อความที่เป็นเท็จ/เกินจริง อาจก่อให้เกิดความเข้าใจผิดในสาระสำคัญ แสดงสรรพคุณรักษาโรค สรรพคุณบำรุงกาม สนับสนุนให้มีการกระทำผิดกฎหมาย ทำให้เกิดความแตกแยก หรือเป็นคำที่มีประกาศห้ามใช้ หรือไม่ ?",
      "firstBox": "มี",
      "secondBox": "ไม่มี",
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
