import 'package:cosmetics_law/providers/badgeChecklist.dart';
import 'package:cosmetics_law/providers/badgeThaiChecklist.dart';
import 'package:cosmetics_law/providers/providers.dart';
import 'package:cosmetics_law/widgets/bottom_bar.dart';
import 'package:cosmetics_law/widgets/custom_material_color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class ConfirmSearchIdPage extends HookConsumerWidget {
  final String title;

  const ConfirmSearchIdPage({Key? key, required this.title}) : super(key: key);

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

    void conditionRoute() {
      final data = ref.watch(BadgeChecklistsProvider).checklist;
      if (data['1'] == true) {
        Navigator.pushNamed(context, '/question7');
      } else if (data['7'] == true) {
        Navigator.pushNamed(context, '/question4');
      } else {
        Navigator.pushNamed(context, '/question4');
      }
    }

    final PageClick = ref.watch(pageClickProvider);
    return Scaffold(
      backgroundColor: CustomMaterialColor(228, 147, 161).mdColor,
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
                              'กรอกเลขที่รับจดแจ้งในระบบค้นหาเครื่องสำอาง',
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
                              Container(
                                constraints: BoxConstraints(maxWidth: 300),
                                child: Text(
                                  'กรณีที่ไม่มีการแสดงเลขจดแจ้งบนฉลากให้ทำการสืบค้นจาก ชื่อผู้ผลิต',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
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
                                    conditionRoute();
                                    // ref
                                    //     .read(pageClickProvider.notifier)
                                    //     .update((state) => true);
                                    // print(PageClick);
                                  },
                                  child: Text('ไปขั้นตอนถัดไป'))
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
          conditionRoute();
        },
      ),
    );
  }
}
