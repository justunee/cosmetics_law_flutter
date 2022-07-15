import 'package:cosmetics_law/widgets/question_list_container.dart';
import 'package:flutter/material.dart';

class Aerobix_question extends StatefulWidget {
  final customAnswer;
  const Aerobix_question({Key? key, this.customAnswer}) : super(key: key);

  @override
  _Aerobix_questionState createState() => _Aerobix_questionState();
}

class _Aerobix_questionState extends State<Aerobix_question> {
  // Generate a list of available hobbies here
  List<Map> thaiBadge = [
    {
      "question": "Total aerobic plate count > 500 cfu/ml หรือ cfu/mg",
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
