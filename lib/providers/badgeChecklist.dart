// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// enum AnswerKey { isLabel, fact }

// @immutable
// class BadgeChecklists {
//   final bool completed;
//   final Map<String, bool, int> checklist;

//   const BadgeChecklists({required this.checklist, required this.completed});

//   BadgeChecklists copyWith({Map<String, bool>? checklist, bool? completed}) {
//     return BadgeChecklists(
//       checklist: checklist ?? this.checklist,
//       completed: completed ?? this.completed,
//     );
//   }

//   BadgeChecklists remove({required String key}) {
//     final newChecklist = Map.of(checklist);
//     newChecklist.remove(key);
//     return copyWith(checklist: newChecklist);
//   }
// }

// class BadgeChecklistsNotifier extends StateNotifier<BadgeChecklists> {
//   BadgeChecklistsNotifier()
//       : super(const BadgeChecklists(checklist: {
//           "221": false,
//           "2221": false,
//           "2222": false,
//           "2223": false,
//           "26": false,
//           "271": false,
//           "272": false,
//           "274": false,
//           "275": false,
//           "284": false,
//           "291": false,
//           "294": false,
//           "321": false,
//           "322": false,
//           "323": false,
//           "324": false,
//           "61": false,
//           "141": false,
//         }, completed: false));

//   void modify(String key, bool value) {
//     state = state.copyWith(checklist: {...state.checklist, key: value});
//   }

//   void answer(bool answer, AnswerKey key) {
//     switch (key) {
//       case AnswerKey.isLabel:
//         if (!answer) {
//           modify("221", true);
//           modify("321", true);
//         }
//         break;
//       case AnswerKey.fact:
//         if (!answer) {
//           modify("2221", true);
//           modify("322", true);
//         }
//         break;
//       default:
//     }
//     print(state.checklist);
//   }
// }

// // Finally, we are using StateNotifierProvider to allow the UI to interact with
// // our TodosNotifier class.
// final BadgeChecklistssProvider =
//     StateNotifierProvider<BadgeChecklistsNotifier, BadgeChecklists>((ref) {
//   return BadgeChecklistsNotifier();
// });
