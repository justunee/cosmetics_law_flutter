import 'package:cosmetics_law/screens/question2_page.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../providers/providers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var controller = TextEditingController();

    var steps = <StepChild>[
      StepChild(
        title: const Text('Step 1'),
        content: const Text('Step 1 content'),
      ),
      StepChild(
        title: const Text('Step 2'),
        content: const Text('Step 2 content'),
      ),
      StepChild(
        title: const Text('Step 3'),
        content: const Text('Step 3 content'),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
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
                ElevatedButton(
                  child: const Text('Go to example provider'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/question_example");
                  },
                ),
                ElevatedButton(
                  child: const Text('Go to example widget'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/question_example_widget");
                  },
                ),
                ElevatedButton(
                  child: const Text('Go to Question1'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/question1");
                  },
                ),

                ElevatedButton(
                  child: const Text('Go to Question2'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/question2");
                  },
                ),
                ElevatedButton(
                  child: const Text('go to question3'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/question3");
                  },
                ),
                ElevatedButton(
                  child: const Text('go to Safety_question1'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/safetyQuestion1");
                  },
                ),

                // This trailing comma makes auto-formatting nicer for build methods.
              ],
            ),
          ),
        );
      }),
    );
  }
}
