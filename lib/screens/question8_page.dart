import 'package:cosmetics_law/providers/providers.dart';
import 'package:cosmetics_law/widgets/bottom_bar.dart';
import 'package:cosmetics_law/widgets/custom_material_color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class Question8Page extends HookConsumerWidget {
  final String title;

  const Question8Page({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _launchURL() async {
      dynamic Url = Uri.parse(
          'http://pertento.fda.moph.go.th/FDA_SEARCH_CENTER/PRODUCT/FRM_SEARCH_CMT.aspx');
      if (await canLaunchUrl(Url)) {
        await launchUrl(Url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $Uri';
      }
    }

    final PageClick = ref.watch(pageClickProvider);
    return Scaffold(
      backgroundColor: CustomMaterialColor(228, 147, 161).mdColor,
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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(clipBehavior: Clip.none, children: [
                Container(
                  constraints: BoxConstraints(
                      minHeight: 100, minWidth: 340, maxHeight: 380),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(38, 16, 38, 16),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            'before next step',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color:
                                  CustomMaterialColor(81, 96, 159).mdColor[900],
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            constraints: BoxConstraints(maxWidth: 300),
                            child: Text(
                              'ค้นหารายการใบรับจดแจ้งที่มีชื่อการค้าหรือชื่อผลิตภัณฑ์เหมือนหรือใกล้เคียงกับเครื่องสำอางที่กำลังตรวจสอบ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 60,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    _launchURL();
                                    Navigator.pushNamed(context, '/question9');
                                  },
                                  child: Text('ไปขึ้นตอนถัดไป'))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -160,
                  left: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/searching.png',
                        scale: 1.1,
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: QuestionareBottomBar(
        onClickAction: () {
          Navigator.pushNamed(context, '/question9');
        },
      ),
    );
  }
}
