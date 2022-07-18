import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/providers.dart';
import '../widgets/widgets.dart';

class ResultPage extends HookConsumerWidget {
  final String title;

  const ResultPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Questionare questionare = ref.watch(questionaresProvider);

    // find all the laws that are true
    List<Widget> violatedLaws = [];
    questionare.checklist.forEach((key, value) {
      if (value) {
        violatedLaws.add(ResultDisplay(lawKey: key));
      }
    });

    List<Widget> sellerViolatedLaws = [];
    questionare.sellerChecklist.forEach((key, value) {
      if (value) {
        sellerViolatedLaws.add(ResultDisplay(lawKey: key));
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('สรุปผลการตรวจสอบ'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/menu', (Route<dynamic> route) => false);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabsBar(
          width: 320,
          tabs: const [
            Tab(
              child: SizedBox(
                width: 200,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("ผู้ผลิต/นำเข้า/รับจ้างผลิต"),
                ),
              ),
            ),
            Tab(
              child: SizedBox(
                width: 140,
                child: Align(
                  alignment: Alignment.center,
                  child: Text("ผู้ขาย"),
                ),
              ),
            ),
          ],
          tabChildrens: [
            Column(
              children: [
                const SizedBox(height: 16),
                SizedBox.fromSize(
                  size: const Size(168, 168),
                  child: ClipOval(
                    child: Material(
                      color: const Color.fromRGBO(255, 227, 232, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/product.png'),
                          const Text(
                            "ผลิตภัณฑ์",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ...violatedLaws,
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 16),
                SizedBox.fromSize(
                  size: const Size(168, 168),
                  child: ClipOval(
                    child: Material(
                      color: const Color.fromRGBO(255, 227, 232, 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('assets/product.png'),
                          const Text(
                            "ผลิตภัณฑ์",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ...sellerViolatedLaws,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
