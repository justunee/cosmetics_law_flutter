import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'custom_material_color.dart';

class StepChild {
  final Widget title;
  final Widget content;

  StepChild({required this.title, required this.content});
}

class StepperWidget extends HookConsumerWidget {
  final List<StepChild> stepChilds;
  final StateProvider<int> currentStepProvider;
  const StepperWidget(
      {Key? key, required this.stepChilds, required this.currentStepProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentStep = ref.watch(currentStepProvider);

    // create steps from this.steps
    var steps = stepChilds.asMap().entries.map((entry) {
      int idx = entry.key;
      StepChild val = entry.value;
      return Step(
        title: val.title,
        content: val.content,
        isActive: currentStep >= idx,
        state: currentStep >= idx
            ? currentStep > idx
                ? StepState.complete
                : StepState.editing
            : StepState.indexed,
      );
    }).toList();

    return Theme(
        data: ThemeData(
          canvasColor: CustomMaterialColor(228, 147, 161).mdColor,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: CustomMaterialColor(228, 147, 161).mdColor,
                secondary: CustomMaterialColor(228, 147, 161).mdColor,
              ),
        ),
        child: Stepper(
          type: StepperType.horizontal,
          steps: steps,
          currentStep: currentStep,
          // remove controls
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return const SizedBox.shrink();
          },
          onStepTapped: (step) {
            ref.read(currentStepProvider.notifier).update((state) => step);
          },
        ));
  }
}
