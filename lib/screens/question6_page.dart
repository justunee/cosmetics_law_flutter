import 'package:cosmetics_law/providers/providers.dart';
import 'package:cosmetics_law/providers/questionare.dart';
import 'package:cosmetics_law/widgets/bottom_bar.dart';
import 'package:cosmetics_law/widgets/producer_name.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Question6Page extends ConsumerStatefulWidget {
  const Question6Page({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  ConsumerState<Question6Page> createState() => _Question6PageState();
}

class _Question6PageState extends ConsumerState<Question6Page> {
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
    void selectedRoute() {
      final data = ref.watch(question5Provider);
      if (Answer[0]["firstBox"] == true && data == true) {
        Navigator.pushNamed(context, '/question10');
      } else if (Answer[0]["firstBox"] == false && data == true) {
        ref
            .read(questionaresProvider.notifier)
            .answer(false, AnswerKey.producerName);
        Navigator.pushNamed(context, '/safetyQuestion1');
      } else if (Answer[0]["firstBox"] == true && data == false) {
        Navigator.pushNamed(context, '/safetyQuestion1');
      } else if (Answer[0]["firstBox"] == false && data == false) {
        ref
            .read(questionaresProvider.notifier)
            .answer(false, AnswerKey.producerName);
        Navigator.pushNamed(context, '/safetyQuestion1');
      }
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.00,
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
                Producer_name_Question(customAnswer: parentSetAnswer)
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: QuestionareBottomBar(
        onClickAction: () {
          // if (Answer[0]["firstBox"] == true) {
          //   Navigator.pushNamed(context, '/question6');
          // } else {
          //   ref
          //       .read(questionaresProvider.notifier)
          //       .answer(false, AnswerKey.nameEqualId);
          //   Navigator.pushNamed(context, '/question6');
          // }
          selectedRoute();
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
