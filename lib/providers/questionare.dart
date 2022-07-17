import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AnswerKey {
  isLabel,
  fact,
  prohibitChem,
  more500,
  haveThai,
  haveFullThai,
  foundId,
  nameEqualId,
  producerName,
  producerName2,
  paperInfo,
  date1before,
  date1after,
  date2after,
  date2NotShow,
}

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
          modify("321", true);
        }
        break;
      case AnswerKey.fact:
        if (!answer) {
          modify("2221", true);
          modify("322", true);
        }
        break;
      case AnswerKey.prohibitChem:
        if (!answer) {
          modify("271", true);
          modify("284", true);
        }
        break;
      case AnswerKey.more500:
        if (!answer) {
          modify("274", true);
          modify("61", true);
        }
        break;
      case AnswerKey.haveThai:
        if (!answer) {
          modify("2222", true);
          modify("323", true);
        }
        break;
      case AnswerKey.haveFullThai:
        if (!answer) {
          modify("2223", true);
          modify("323", true);
        }
        break;
      case AnswerKey.foundId:
        if (!answer) {
          modify("272", true);
          modify("294", true);
        }
        break;
      case AnswerKey.nameEqualId:
        if (!answer) {
          modify("272", true);
          modify("294", true);
        }
        break;
      case AnswerKey.producerName:
        if (!answer) {
          modify("272", true);
          modify("291", true);
        }
        break;
      case AnswerKey.producerName2:
        if (!answer) {
          modify("272", true);
          modify("291", true);
        }
        break;
      case AnswerKey.paperInfo:
        if (!answer) {
          modify("272", true);
          modify("291", true);
        }
        break;
      case AnswerKey.date1before:
        if (!answer) {
          modify("275", true);
          modify("61", true);
        }
        break;
      case AnswerKey.date1after:
        if (!answer) {
          modify("275", true);
          modify("61", true);
        }
        break;
      case AnswerKey.date2after:
        if (!answer) {
          modify("272", true);
          modify("294", true);
        }
        break;

      case AnswerKey.date2NotShow:
        if (!answer) {
          modify("141", true);
          modify("321", true);
        }
        break;
      default:
    }
    print(state.checklist);
  }
}

// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final questionaresProvider =
    StateNotifierProvider<QuestionareNotifier, Questionare>((ref) {
  return QuestionareNotifier();
});
