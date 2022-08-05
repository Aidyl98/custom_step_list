import 'package:flutter/material.dart';

import 'package:custom_step_list/custom_step.dart';

class CustomStepListWidget extends StatelessWidget {
  /// The list whit all the steps of the [CustomStepListWidget].
  final List<CustomStep> steps;

  /// Changes the shape of the step.
  /// * If false show the steps as circles.
  /// * If true show the steps as squares.
  final bool changeStepShape;

  /// Padding around the step such as:
  /// the circle, the title, the subtitle and the line with his content.
  final EdgeInsetsGeometry stepPadding;

  /// Padding around the list of steps. All the steps.
  final EdgeInsetsGeometry stepListPadding;

  /// If the list admit scroll or not.
  ///
  ///  Default to [NeverScrollableScrollPhysics].
  final ScrollPhysics stepListPhysics;

  
}
