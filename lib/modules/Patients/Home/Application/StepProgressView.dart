import 'package:flutter/material.dart';
import 'package:eshop/components/Constants/AppColors.dart';

class StepProgressView extends StatelessWidget {
  final double currentProgress; // Use double for percentage
  final int totalSteps;

  StepProgressView({
    Key? key,
    required this.currentProgress,
    required this.totalSteps,
  })  : assert(currentProgress >= 0.0 && currentProgress <= 1.0),
        assert(totalSteps > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final int currentStep =
        (currentProgress * totalSteps).floor(); // Calculate current step

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildSteps(currentStep), // Pass calculated currentStep
    );
  }

  List<Widget> _buildSteps(int currentStep) {
    List<Widget> steps = [];

    for (int i = 0; i < totalSteps; i++) {
      final double stepProgress = i / totalSteps;
      final Color? stepColor =
          i < currentStep ? AppColors.bgColor : AppColors.whiteColor;
      final Color lineColor = i < currentStep
          ? AppColors.bgColor
          : AppColors.slightlyGrey; // Consistent line color

      steps.add(
        Container(
          width: 20.0, // Adjust the width as needed
          height: 20.0, // Adjust the height as needed
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: stepColor, // Dynamic color for step circle
            border: Border.all(
              color: i <= currentStep
                  ? AppColors.bgColor
                  : AppColors.slightlyGrey, // Consistent line color
              width: 1.0,
            ),
          ),
          child: i < currentStep
              ? Icon(
                  Icons.check,
                  color: AppColors.whiteColor,
                  size: 16.0,
                )
              : Center(
                  child: Container(
                    width: 5.0, // Adjust the width as needed
                    height: 5.0, // Adjust the height as needed
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i < currentStep
                          ? AppColors.bgColor
                          : i == currentStep
                              ? AppColors.bgColor
                              : AppColors
                                  .slightlyGrey, // White if active, AppColors.bgColor otherwise
                    ),
                  ),
                ),
//
        ),
      );

      // Add line between circles (except for the last one)
      if (i < totalSteps - 1) {
        steps.add(
          Expanded(
            child: Container(
              height: 1.0, // Adjust line height as needed
              color: lineColor, // Consistent line color
            ),
          ),
        );
      }
    }

    return steps;
  }
}
