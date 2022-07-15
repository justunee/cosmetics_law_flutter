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
                Producer_name_Question(customAnswer: parentSetAnswer)
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: QuestionareBottomBar(
        onClickAction: () {
          if (Answer[0]["firstBox"] == true) {
            Navigator.pushNamed(context, '/safetyQuestion2');
          } else {
            Navigator.pushNamed(context, '/safetyQuestion3');
          }
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
