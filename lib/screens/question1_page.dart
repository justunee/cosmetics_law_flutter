import 'package:cosmetics_law/providers/questionare.dart';
import 'package:cosmetics_law/widgets/widget_QHaveBadge.dart';
import 'package:cosmetics_law/widgets/bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Question1Page extends ConsumerStatefulWidget {
  const Question1Page({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  ConsumerState<Question1Page> createState() => _Question1PageState();
}

class _Question1PageState extends ConsumerState<Question1Page> {
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
    Questionare questionare = ref.watch(questionaresProvider);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.00,
        // Here we take the value from the TrueFlase object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
          child: const Text('โหมดผลิตภัณฑ์',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        ),
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
              children: <Widget>[TFQHaveBadge(customAnswer: parentSetAnswer)],
            ),
          ),
        ),
      ),
      bottomNavigationBar: QuestionareBottomBar(
        onClickAction: () {
          if (Answer[0]["firstBox"] == true) {
            Navigator.pushNamed(context, '/question2');
          } else {
            ref
                .read(questionaresProvider.notifier)
                .answer(false, AnswerKey.isLabel);
            Navigator.pushNamed(context, '/safetyQuestion1');
          }
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
