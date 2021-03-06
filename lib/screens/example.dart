import 'package:cosmetics_law/screens/question2_page.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import '../providers/providers.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
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
        title: const Text('การมีฉลาก'),
        content: const Text('Step 1 content'),
      ),
      StepChild(
        title: const Text('ความครบถ้วน'),
        content: const Text('Step 2 content'),
      ),
      StepChild(
        title: const Text('ความถูกต้อง'),
        content: const Text('Step 3 content'),
      ),
      // StepChild(
      //   title: const Text('ความปลอดภัย'),
      //   content: const Text('Step 4 content'),
      // ),
    ];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the ExamplePage object that was created by
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
                const ExampleWidget(),
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Textfield(
                  controller: controller,
                ),
                ElevatedButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(controller.text),
                          );
                        }),
                    child: const Text('Submit text')),
                const SizedBox(
                  height: 500,
                  child: TabsBar(
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: 100,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("APPS"),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: 100,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("MOVIES"),
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: 100,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("GAMES"),
                          ),
                        ),
                      ),
                    ],
                    tabChildrens: [
                      Icon(Icons.directions_car),
                      Icon(Icons.directions_transit),
                      Icon(Icons.directions_bike),
                    ],
                  ),
                ),

                ElevatedButton(
                  child: const Text('Go to Question'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/question2");
                  },
                ),
                SizedBox(
                    height: 200,
                    child: StepperWidget(
                      currentStepProvider: stepProvider,
                      stepChilds: steps,
                    )),

                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
                Textfield(
                  controller: controller,
                ),
                ElevatedButton(
                    onPressed: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(controller.text),
                          );
                        }),
                    child: const Text('Submit text')),
                ElevatedButton(
                  child: const Text('Go to Question'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/question_lists");
                  },
                ),
                ElevatedButton(
                  child: const Text('Go to have_badge'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/question1");
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
