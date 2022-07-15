import 'package:cosmetics_law/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../providers/providers.dart';
import 'custom_material_color.dart';

class BaseBottomBar extends HookConsumerWidget {
  final Function onClickAction;
  final List<BottomNavigationBarItem> items;
  const BaseBottomBar(
      {Key? key, required this.onClickAction, required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);

    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              items: items,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white,
              backgroundColor: CustomMaterialColor(228, 147, 161).mdColor,
              onTap: (int index) {
                if (index == 0) {
                  // navigate home
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/', (Route<dynamic> route) => false);
                } else {
                  onClickAction();
                }
              },
            )));
  }
}

class QuestionareBottomBar extends StatelessWidget {
  final Function onClickAction;
  const QuestionareBottomBar({Key? key, required this.onClickAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.arrow_circle_right,
        ),
        label: 'Next',
      ),
    ];

    return BaseBottomBar(
        items: bottomNavigationBarItems, onClickAction: onClickAction);
  }
}

class DeleteBottomBar extends StatelessWidget {
  final Function onClickAction;
  const DeleteBottomBar({Key? key, required this.onClickAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: Container(
              height: 60,
              color: CustomMaterialColor(228, 147, 161).mdColor,
              child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () => print('delete'),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Column(
                            children: const <Widget>[
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                              Text('Delete',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ))),
            )));
  }
}
