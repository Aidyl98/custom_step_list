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

  ///////////////////////////////// LINE ///////////////////////////////////////

  /// The color of the separator line.
  final Color lineColor;

  /// Show or not the line that separates the steps.
  final bool showSeparatorLine;

  /// The width of the line that separates the steps.
  final double lineWidth;

  /// The height of the line that separates the steps.
  final double lineHeight;

  /////////////////////////////// CIRCLE ///////////////////////////////////////

  /// The width of the circle that mark a step.
  final double circleWidth;

  /// The height of the circle that mark a step.
  final double circleHeight;

  /// The empty space that surround the [circleShapeDecoration] and [child].
  final EdgeInsetsGeometry circleMargin;

  /// A [ShapeDecoration] defines the color and the form of the circle.
  /// * Example for circle use [CircleBorder].
  /// * Example for square use [RoundedRectangleBorder]
  final ShapeDecoration? circleShapeDecoration;

  /// The color that fill the circle. For more customization use the [circleShapeDecoration].
  final Color circleColor;

  /// The color that surround/border the circle. For more customization use the [circleShapeDecoration].
  final Color circleBorderColor;

  /// The widget inside the circle.
  ///
  /// For example can be a number or an icon.
  final Widget? circleChild;

  ////////////////////////// TITLE & SUBTITLE //////////////////////////////////

  /// The style of the title widget.
  final TextStyle titleTextStyle;

  /// The style of the subtitle widget.
  final TextStyle subtitleTextStyle;

  
}
