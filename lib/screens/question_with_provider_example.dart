import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/widgets.dart';
import '../providers/providers.dart';

class MyExamplePage extends ConsumerWidget {
  const MyExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Questionare questionare = ref.watch(questionaresProvider);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("My Example Page"),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  questionare.checklist["221"] == true
                      ? "Question 221 is completed"
                      : "Question 221 is not completed",
                  style: Theme.of(context).textTheme.headline4,
                ),
                ElevatedButton(
                  child: const Text('Change answer isLabel'),
                  onPressed: () {
                    ref
                        .read(questionaresProvider.notifier)
                        .answer(false, AnswerKey.isLabel);
                  },
                ),
                ElevatedButton(
                  child: const Text('Go to Question'),
                  onPressed: () {
                    Navigator.pushNamed(context, "/question2");
                  },
                ),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: QuestionareBottomBar(
        onClickAction: () {
          print('next');
        },
      ),
    );
  }
}
