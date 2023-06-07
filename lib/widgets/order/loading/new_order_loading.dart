import 'package:flutter/material.dart';

import 'package:im_stepper/stepper.dart';
import 'package:telin_project/constants/style.dart';
import 'package:telin_project/widgets/order/loading/bats_loading.dart';
import 'package:telin_project/widgets/order/loading/cable_&_kit.dart';
import 'package:telin_project/widgets/order/loading/form/loading_form.dart';

class NewOrderLoading extends StatefulWidget {
  const NewOrderLoading({super.key});

  @override
  State<NewOrderLoading> createState() => _NewOrderLoadingState();
}

class _NewOrderLoadingState extends State<NewOrderLoading> {
  int activeStep = 0; // Initial step set to 5.

  int upperBound = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NumberStepper(
              numbers: const [
                1,
                2,
                3,
              ],
              numberStyle: TextStyle(color: light),
              activeStepColor: active,
              activeStepBorderColor: active,

              enableNextPreviousButtons: false,

              // activeStep property set to activeStep variable defined above.
              activeStep: activeStep,
              lineColor: active,

              // This ensures step-tapping updates the activeStep.
              onStepReached: (index) {
                setState(() {
                  activeStep = index;
                });
              },
            ),
            contentLoading()
          ],
        ),
      ),
    );
  }

  Widget nextButton() {
    return ElevatedButton(
      onPressed: () {
        // Increment activeStep, when the next button is tapped. However, check for upper bound.
        if (activeStep < upperBound) {
          setState(() {
            activeStep++;
          });
        }
      },
      child: const Text('Next'),
    );
  }

  // Returns the header text based on the activeStep.
  contentLoading() {
    switch (activeStep) {
      case 1:
        return const CableDanKitLoading(id: "xckik");

      // case 2:
      //   return const BastLoading();

      default:
        return FormLoading();
    }
  }

  /// Returns the previous button.
  Widget previousButton() {
    return ElevatedButton(
      onPressed: () {
        // Decrement activeStep, when the previous button is tapped. However, check for lower bound i.e., must be greater than 0.
        if (activeStep > 0) {
          setState(() {
            activeStep--;
          });
        }
      },
      child: const Text('Prev'),
    );
  }
}
