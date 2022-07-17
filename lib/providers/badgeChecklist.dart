import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class BadgeChecklists {
  final bool completed;
  final Map<String, bool> checklist;

  const BadgeChecklists({required this.checklist, required this.completed});

  BadgeChecklists copyWith({Map<String, bool>? checklist, bool? completed}) {
    return BadgeChecklists(
      checklist: checklist ?? this.checklist,
      completed: completed ?? this.completed,
    );
  }

  BadgeChecklists remove({required String key}) {
    final newChecklist = Map.of(checklist);
    newChecklist.remove(key);
    return copyWith(checklist: newChecklist);
  }
}

class BadgeChecklistsNotifier extends StateNotifier<BadgeChecklists> {
  BadgeChecklistsNotifier()
      : super(const BadgeChecklists(checklist: {
          "1": false,
          "2": false,
          "3": false,
          "4": false,
          "5": false,
          "6": false,
          "7": false,
          "8": false,
          "9": false,
          "10": false,
          "11": false,
        }, completed: false));

  void modify(String key, bool value) {
    state = state.copyWith(checklist: {...state.checklist, key: value});
  }

  void answer(String id, bool isChecked) {
    modify(id, isChecked);
  }
}

// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our TodosNotifier class.
final BadgeChecklistsProvider =
    StateNotifierProvider<BadgeChecklistsNotifier, BadgeChecklists>((ref) {
  return BadgeChecklistsNotifier();
});
