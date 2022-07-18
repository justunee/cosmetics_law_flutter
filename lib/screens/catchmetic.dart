import 'package:cosmetics_law/widgets/custom_material_color.dart';
import 'package:cosmetics_law/widgets/custom_material_color.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CatchmeticPage extends HookConsumerWidget {
  final String title;

  const CatchmeticPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: CustomMaterialColor(228, 147, 161).mdColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(49, 0, 49, 0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Catchmetic',
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      SizedBox(
                        height: 160,
                      ),
                      Container(
                          constraints: BoxConstraints(maxWidth: 300),
                          child: MaterialButton(
                            shape: const CircleBorder(),
                            color: Colors.white,
                            padding: const EdgeInsets.all(20),
                            onPressed: () {
                              Navigator.pushNamed(context, '/disclaimer');
                            },
                            child: const Icon(Icons.chevron_right,
                                size: 30,
                                color: Color.fromRGBO(228, 147, 161, 1)),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
