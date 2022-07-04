import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AnswerKey { isLabel }

@immutable
class Questionare {
  const Questionare({required this.checklist, required this.completed});

  final bool completed;
  final Map<String, bool> checklist;

  Questionare copyWith({Map<String, bool>? checklist, bool? completed}) {
    return Questionare(
      checklist: checklist ?? this.checklist,
      completed: completed ?? this.completed,
    );
  }

  Questionare remove({required String key}) {
    final newChecklist = Map.of(checklist);
    newChecklist.remove(key);
    return copyWith(checklist: newChecklist);
  }
}

class QuestionareNotifier extends StateNotifier<Questionare> {
  QuestionareNotifier()
      : super(const Questionare(checklist: {
          "221": false,
          "2221": false,
          "2222": false,
          "2223": false,
          "26": false,
          "271": false,
          "272": false,
          "274": false,
          "275": false,
          "284": false,
          "291": false,
          "294": false,
          "321": false,
          "322": false,
          "323": false,
          "324": false,
          "61": false,
          "141": false,
        }, completed: false));

  void modify(String key, bool value) {
    state = state.copyWith(checklist: {...state.checklist, key: value});
  }

  void answer(bool answer, AnswerKey key) {
    switch (key) {
      case AnswerKey.isLabel:
        if (!answer) {
          modify("221", true);
          modify("322", true);
        }
        break;
      default:
    }
  }
}

// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final questionaresProvider =
    StateNotifierProvider<QuestionareNotifier, Questionare>((ref) {
  return QuestionareNotifier();
});
