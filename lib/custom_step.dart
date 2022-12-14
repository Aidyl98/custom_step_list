import 'package:custom_step_list/custom_step_state.dart';
import 'package:flutter/material.dart';

class CustomStep {
  /// The title of the step that typically describes it.
  final Widget title;

  /// The subtitle of the step that appears below the title and has a smaller
  /// font size. It typically gives more details that complement the title.
  ///
  /// If null, the subtitle is not shown.
  final Widget? subtitle;

  /// The content of the step that appears below the line that conect
  /// a line with another.
  ///
  /// If null, the endOfLineContent is not shown.
  final Widget? endOfLineContent;

  /// The content of the step that appears inside the circle.
  ///
  /// If this parameter is set then `circleChild`, `showNumbers`
  /// and `showCircleChildByState` will not be taken into account.
  final Widget? circleChild;

  /// The state of the step which determines the styling of its components
  /// and whether steps are interactive.
  final CustomStepState state;

  /// Whether or not the step is active. The flag only influences styling.
  final bool isActive;

  /// To change the decoration (shape and color) of a specific step.
  final Decoration? circleDecoration;

  /// To change the shape of a specific step.
  final ShapeBorder? circleShape;

  /// To change the color of a specific step.
  final Color? circleColor;

  /// To change the color of the border of a specific step.
  final Color? circleBorderColor;

  /// Creates a step for a [CustomStepListWidget].
  ///
  /// The [title] argument must not be null.
  const CustomStep({
    required this.title,
    this.subtitle,
    this.circleChild,
    this.endOfLineContent,
    this.state = CustomStepState.normal,
    this.isActive = true,
    this.circleDecoration,
    this.circleShape,
    this.circleColor,
    this.circleBorderColor,
  });
}
