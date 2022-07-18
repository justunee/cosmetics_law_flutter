import 'package:flutter/material.dart';
import '../const.dart';

class ResultDisplay extends StatelessWidget {
  final String lawKey;

  const ResultDisplay({Key? key, required this.lawKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(children: [
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(244, 243, 246, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text(lawMap[lawKey] ?? "")),
            ),
          ),
        ),
      ]),
    );
  }
}
