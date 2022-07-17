import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@immutable
class BadgeThaiChecklists {
  final bool completed;
  final Map<String, bool> checklist;

  const BadgeThaiChecklists({required this.checklist, required this.completed});

  BadgeThaiChecklists copyWith(
      {Map<String, bool>? checklist, bool? completed}) {
    return BadgeThaiChecklists(
      checklist: checklist ?? this.checklist,
      completed: completed ?? this.completed,
    );
  }

  BadgeThaiChecklists remove({required String key}) {
    final newChecklist = Map.of(checklist);
    newChecklist.remove(key);
    return copyWith(checklist: newChecklist);
  }
}

class BadgeThaiChecklistsNotifier extends StateNotifier<BadgeThaiChecklists> {
  BadgeThaiChecklistsNotifier()
      : super(const BadgeThaiChecklists(checklist: {
          "1": false,
          "2": false,
          "3": false,
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
final BadgeThaiChecklistsProvider =
    StateNotifierProvider<BadgeThaiChecklistsNotifier, BadgeThaiChecklists>(
        (ref) {
  return BadgeThaiChecklistsNotifier();
});
