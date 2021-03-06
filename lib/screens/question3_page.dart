import 'package:cosmetics_law/providers/badgeChecklist.dart';
import 'package:cosmetics_law/providers/questionare.dart';
import 'package:cosmetics_law/widgets/bottom_bar.dart';
import 'package:cosmetics_law/widgets/true_false.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Question3Page extends ConsumerStatefulWidget {
  const Question3Page({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  ConsumerState<Question3Page> createState() => _Question3PageState();
}

class _Question3PageState extends ConsumerState<Question3Page> {
  List<Map> Answer = [
    {
      "firstBox": false,
      "secondBox": false,
    },
  ];

  void parentSetAnswer(bool firstBox, bool secondBox) {
    setState(() {
      Answer[0]["firstBox"] = firstBox;
      Answer[0]["secondBox"] = secondBox;
    });
    print(Answer[0]["firstBox"]);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.00,
        // Here we take the value from the TrueFlase object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('โหมดผลิตภัณฑ์',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TrueFalseQuestion(customAnswer: parentSetAnswer)
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: QuestionareBottomBar(
        onClickAction: () {
          final data = ref.watch(BadgeChecklistsProvider).checklist;
          if (data['1'] == false && data['7'] == false) {
            if (Answer[0]["firstBox"] == true) {
              ref
                  .read(questionaresProvider.notifier)
                  .answer(false, AnswerKey.fact);
              Navigator.pushNamed(context, '/safetyQuestion1');
            } else {
              Navigator.pushNamed(context, '/safetyQuestion1');
            }
          } else {
            if (Answer[0]["firstBox"] == true) {
              ref
                  .read(questionaresProvider.notifier)
                  .answer(false, AnswerKey.fact);
              Navigator.pushNamed(context, '/searchProd');
            } else {
              Navigator.pushNamed(context, '/searchProd');
            }
          }
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
