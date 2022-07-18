import 'package:cosmetics_law/screens/catchmetic.dart';
import 'package:cosmetics_law/screens/disclaimer.dart';
import 'package:cosmetics_law/screens/example.dart';
import 'package:cosmetics_law/screens/menu.dart';
import 'package:cosmetics_law/screens/question10_page.dart';
import 'package:cosmetics_law/screens/question11_page.dart';
import 'package:cosmetics_law/screens/question12_page.dart';
import 'package:cosmetics_law/screens/question4_page.dart';
import 'package:cosmetics_law/screens/question5_page.dart';
import 'package:cosmetics_law/screens/question6_page.dart';
import 'package:cosmetics_law/screens/question7_page.dart';
import 'package:cosmetics_law/screens/question8_page.dart';
import 'package:cosmetics_law/screens/question9_page.dart';
import 'package:cosmetics_law/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cosmetics_law/widgets/custom_material_color.dart';

void main() {
  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Sukhumvit Set',
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.amber,
        // scaffoldBackgroundColor: CustomMaterialColor(228, 147, 161).mdColor,
        primarySwatch: CustomMaterialColor(228, 147, 161).mdColor,
        backgroundColor: CustomMaterialColor(228, 147, 161).mdColor,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        '/question_example': (BuildContext context) => const MyExamplePage(),
        '/question_example_widget': (BuildContext context) => const ExamplePage(
              title: 'example',
            ),
        // '/result': (BuildContext context) =>
        //     const Question1Page(title: 'have_badge'),
        '/menu': (BuildContext context) => const MenuPage(title: 'have_badge'),
        '/disclaimer': (BuildContext context) =>
            const DisclaimerPage(title: 'have_badge'),
        '/catchmetic': (BuildContext context) =>
            const CatchmeticPage(title: 'Catchemtic'),
        '/question1': (BuildContext context) =>
            const Question1Page(title: 'have_badge'),
        '/question2': (BuildContext context) =>
            const Question2Page(title: 'Listed_in_cosmetics_badge'),
        '/question3': (BuildContext context) =>
            const Question3Page(title: 'true_false_info'),
        '/searchProd': (BuildContext context) =>
            const SearchProductIdPage(title: 'search_Prod'),
        '/question4': (BuildContext context) =>
            const Question4Page(title: 'true_false_info'),
        '/question5': (BuildContext context) =>
            const Question5Page(title: 'true_false_info'),
        '/question6': (BuildContext context) =>
            const Question6Page(title: 'true_false_info'),
        '/question7': (BuildContext context) =>
            const Question7Page(title: 'true_false_info'),
        '/question8': (BuildContext context) =>
            const Question8Page(title: 'true_false_info'),
        '/question9': (BuildContext context) =>
            const Question9Page(title: 'true_false_info'),
        '/question10': (BuildContext context) =>
            const Question10Page(title: 'true_false_info'),
        '/question11': (BuildContext context) =>
            const Question11Page(title: 'true_false_info'),
        '/question12': (BuildContext context) =>
            const Question12Page(title: 'true_false_info'),
        '/confirmSearchProd': (BuildContext context) =>
            const ConfirmSearchIdPage(title: 'confirm_search_Prod'),
        '/safetyQuestion1': (BuildContext context) =>
            const Safe_question1Page(title: 'safety_question1'),
        '/safetyQuestion2': (BuildContext context) =>
            const Safe_question2Page(title: 'safety_question2'),
        '/safetyQuestion3': (BuildContext context) =>
            const Safe_question3Page(title: 'safety_question3'),
        '/safetyQuestion4': (BuildContext context) =>
            const Safe_question4Page(title: 'safety_question4'),
        '/safetyQuestion5': (BuildContext context) =>
            const Safe_question5Page(title: 'safety_question5'),
        '/safetyQuestion6': (BuildContext context) =>
            const Safe_question6Page(title: 'safety_question6'),
        '/safetyQuestion7': (BuildContext context) =>
            const Safe_question7Page(title: 'safety_question7'),
      },
    );
  }
}
