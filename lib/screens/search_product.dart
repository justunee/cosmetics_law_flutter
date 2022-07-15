import 'package:cosmetics_law/providers/providers.dart';
import 'package:cosmetics_law/widgets/bottom_bar.dart';
import 'package:cosmetics_law/widgets/custom_material_color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchProductIdPage extends HookConsumerWidget {
  final String title;

  const SearchProductIdPage({Key? key, required this.title}) : super(key: key);

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
      body: SafeArea(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/searching.png',
                  scale: 1.1,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  constraints: const BoxConstraints(
                      minHeight: 100, minWidth: 340, maxHeight: 380),
                  decoration: const BoxDecoration(
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
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 300),
                            child: const Text(
                              'กรุณาตรวจสอบข้อมูลของผลิตภัณฑ์ที่ ‘ระบบค้นหาเครื่องสำอาง’',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 300),
                                child: const Text(
                                  'ขั้นตอน:เข้าไปที่เว็บไซต์ของกองควบคุมเครื่องสำอาง > เลือกปุ่ม',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Image.asset('assets/magnifier.png'),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 300),
                                child: const Text(
                                  'หรือ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    _launchURL();
                                    ref
                                        .read(pageClickProvider.notifier)
                                        .update((state) => true);
                                    Navigator.pushNamed(
                                        context, '/confirmSearchProd');
                                  },
                                  child: const Text(
                                      'แตะที่นี่ เพื่อไปที่ระบบค้นหา'))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Image.asset(
            //   'assets/Searching.svg',
            //   fit: BoxFit.cover,
            //   height: MediaQuery.of(context).size.height * 0.3,
            // ),
          ],
        )),
      ),
      bottomNavigationBar: QuestionareBottomBar(
        onClickAction: () {
          Navigator.pushNamed(context, '/confirmSearchProd');
        },
      ),
    );
  }
}
