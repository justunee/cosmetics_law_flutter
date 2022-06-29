import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import 'custom_material_color.dart';

class TabsBar extends StatelessWidget {
  const TabsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: CustomMaterialColor(176, 88, 102).mdColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(1, 2),
            blurRadius: 5,
            spreadRadius: 2,
            color: CustomMaterialColor(138, 69, 80).mdColor,
            inset: true,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: DefaultTabController(
          length: 3,
          child: SizedBox(
            height: 30,
            width: 280,
            child: TabBar(
                unselectedLabelColor:
                    CustomMaterialColor(255, 171, 178).mdColor,
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.values[1],
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: CustomMaterialColor(228, 147, 161).mdColor),
                tabs: const [
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
                ]),
          ),
        ),
      ),
    );
  }
}
