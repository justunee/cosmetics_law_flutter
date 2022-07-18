import 'package:cosmetics_law/widgets/custom_material_color.dart';
import 'package:cosmetics_law/widgets/custom_material_color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DisclaimerPage extends HookConsumerWidget {
  final String title;

  const DisclaimerPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: CustomMaterialColor(228, 147, 161).mdColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                  color: Colors.white,
                  constraints: BoxConstraints(maxWidth: 340, maxHeight: 370),
                  child: Column(
                    children: [
                      Container(
                          child: Image.asset(
                        'assets/Disclaimer.png',
                        width: 340,
                      )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          'Catchmetic',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          'เป็นแอปพลิเคชันที่ใช้สำหรับประเมินผลิตภัณฑ์เครื่องสำอางตามกฎหมาย ซึ่งอยู่ในขั้นตอนการพัฒนา สำหรับใช้ตรวจสอบการกระทำผิดเบื้องต้นเท่านั้นไม่สามารถใช้เป็นข้อยุติในการดำเนินคดีทางกฎหมายได้',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.8),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding:
                                const EdgeInsets.fromLTRB(100, 10, 100, 10),
                            primary: Color.fromRGBO(247, 206, 198, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/menu');
                          },
                          child: Text('เริ่มตรวจสอบ'))
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
