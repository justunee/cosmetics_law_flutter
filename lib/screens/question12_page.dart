import 'package:cosmetics_law/providers/FDAweb.dart';
import 'package:cosmetics_law/providers/badgeChecklist.dart';
import 'package:cosmetics_law/providers/questionare.dart';
import 'package:cosmetics_law/widgets/bottom_bar.dart';
import 'package:cosmetics_law/widgets/date_check2.dart';
import 'package:cosmetics_law/widgets/status_cosme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Question12Page extends ConsumerStatefulWidget {
  const Question12Page({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  ConsumerState<Question12Page> createState() => _Question12PageState();
}

class _Question12PageState extends ConsumerState<Question12Page> {
  List<Map> Answer = [
    {
      "firstBox": false,
      "secondBox": false,
      "thirdBox": false,
    },
  ];

  void parentSetAnswer(bool firstBox, bool secondBox, bool thirdBox) {
    setState(() {
      Answer[0]["firstBox"] = firstBox;
      Answer[0]["secondBox"] = secondBox;
      Answer[0]["thirdBox"] = thirdBox;
    });
    print(Answer[0]);
  }

  @override
  Widget build(BuildContext context) {
    void dateCompare() {
      final date = ref.watch(date3Provider);
      final date1 = ref.watch(date4Provider);
      // if (date.compareTo(date1) == 0) {
      //   print("Both date time are at same moment.");
      // }

      if (date.compareTo(date1) < 0) {
        Navigator.pushNamed(context, '/safetyQuestion1');
      }
      if (date.compareTo(date1) > 0) {
        final checklist = ref.watch(BadgeChecklistsProvider).checklist;
        if (checklist['1'] == false) {
          ref
              .read(questionaresProvider.notifier)
              .answer(false, AnswerKey.date2after);7
          Navigator.pushNamed(context, '/safetyQuestion1');
        } else {
          ref
              .read(questionaresProvider.notifier)
              .answer(false, AnswerKey.date2NotShow);
          Navigator.pushNamed(context, '/safetyQuestion1');
        }

        // print("date is after date1");
      }
    }

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
              children: <Widget>[Date2_check_Question()],
            ),
          ),
        ),
      ),
      bottomNavigationBar: QuestionareBottomBar(
        onClickAction: () {
          dateCompare();
        },
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
