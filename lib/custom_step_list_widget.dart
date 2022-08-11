import 'package:custom_step_list/custom_step_state.dart';
import 'package:flutter/material.dart';

import 'package:custom_step_list/custom_step.dart';

class CustomStepListWidget extends StatelessWidget {
  /// The list whit all the steps of the [CustomStepListWidget].
  final List<CustomStep> steps;

  /// Changes the shape of the step.
  /// * If false show the steps as circles.
  /// * If true show the steps as squares.
  final bool changeStepShape;

  /// If this bool is set to true it will show a number inside the circle steps
  /// matching is order.
  ///
  /// For example: the first circle step is going to have the number one inside.
  final bool showNumbers;

  /// If this bool is set to true it will show a child/icon inside the circle
  /// matching the state of the step.
  ///
  /// For example:
  /// * Complete: Show Icons.check,
  /// * Normal: Show Icons.circle,
  /// * Error: Show Icons.close,
  final bool showCircleChildByState;

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

  /// If [showNumbers] is true numbers are been show inside the cicle.
  /// For styling use this property.
  final TextStyle circleNumbersTextStyle;

  /// If [showCircleChildByState] is true a child is been show inside the cicle.
  /// According to the status of every step.
  ///
  /// To change the child/icon when the state is complete use this property.
  final Widget? circleChildCompleteStatus;

  /// If [showCircleChildByState] is true a child is been show inside the cicle.
  /// According to the status of every step.
  ///
  /// To change the child/icon when the state is normal use this property.
  final Widget? circleChildNormalStatus;

  /// If [showCircleChildByState] is true a child is been show inside the cicle.
  /// According to the status of every step.
  ///
  /// To change the child/icon when the state is error use this property.
  final Widget? circleChildErrorStatus;

  /// If [showCircleChildByState] is true a child is been show inside the cicle.
  /// According to the status of every step.
  ///
  /// To change the color of the child/icon when the state is complete use this property.
  final Color circleChildCompleteStatusColor;

  /// If [showCircleChildByState] is true a child is been show inside the cicle.
  /// According to the status of every step.
  ///
  /// To change the color of the child/icon when the state is normal use this property.
  final Color circleChildNormalStatusColor;

  /// If [showCircleChildByState] is true a child is been show inside the cicle.
  /// According to the status of every step.
  ///
  /// To change the color of the child/icon when the state is error use this property.
  final Color circleChildErrorStatusColor;

  /// If [showCircleChildByState] is true a child is been show inside the cicle.
  /// According to the status of every step.
  ///
  /// To change the size of this childs/icons use this property.
  final double? circleChildSize;

  ////////////////////////// TITLE & SUBTITLE //////////////////////////////////

  /// The style of the title widget.
  final TextStyle titleTextStyle;

  /// The style of the subtitle widget.
  final TextStyle subtitleTextStyle;

  /// The margin before the texts.
  ///
  /// Space between the circle and the title/subtitle.
  final EdgeInsetsGeometry textsMargin;

  /// The padding around the texts.
  ///
  /// Space around the title and subtitle.
  final EdgeInsetsGeometry? textsPadding;

  /// Builds a custom `Step List Widget`.
  const CustomStepListWidget({
    Key? key,
    required this.steps,
    this.changeStepShape = false,
    this.showNumbers = false,
    this.showCircleChildByState = false,
    this.stepPadding = const EdgeInsets.symmetric(horizontal: 12),
    this.stepListPadding = EdgeInsets.zero,
    this.stepListPhysics = const NeverScrollableScrollPhysics(),
    ////  LINE  ////
    this.lineColor = Colors.black,
    this.showSeparatorLine = true,
    this.lineHeight = 25.0,
    this.lineWidth = 1.0,
    ////  CIRCLE  ////
    this.circleWidth = 30.0,
    this.circleHeight = 30.0,
    this.circleMargin = const EdgeInsets.symmetric(vertical: 8.0),
    this.circleShapeDecoration,
    this.circleColor = Colors.white,
    this.circleBorderColor = Colors.black,
    this.circleChild,
    this.circleNumbersTextStyle = const TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
    this.circleChildCompleteStatus,
    this.circleChildNormalStatus,
    this.circleChildErrorStatus,
    this.circleChildCompleteStatusColor = Colors.green,
    this.circleChildNormalStatusColor = Colors.white,
    this.circleChildErrorStatusColor = Colors.red,
    this.circleChildSize,
    //// TITLE & SUBTITLE ////
    this.titleTextStyle = const TextStyle(fontSize: 20, color: Colors.black),
    this.subtitleTextStyle = const TextStyle(fontSize: 17, color: Colors.grey),
    this.textsMargin = const EdgeInsetsDirectional.only(start: 12.0),
    this.textsPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// If it is the last step don't show the last separator line.
    bool _isLast(int index) {
      return steps.length - 1 == index;
    }

    /// Builds the line that separates the steps.
    Widget _buildLine(bool visible) {
      return Container(
        width: visible && showSeparatorLine ? lineWidth : 0.0,
        height: lineHeight,
        color: lineColor,
      );
    }

    Widget _getStateIcon(CustomStepState state) {
      switch (state) {
        case CustomStepState.complete:
          return circleChildCompleteStatus ??
              Center(
                child: Icon(
                  Icons.check,
                  color: circleChildCompleteStatusColor,
                  size: circleChildSize,
                ),
              );
        case CustomStepState.normal:
          return circleChildCompleteStatus ??
              Center(
                child: Icon(
                  Icons.circle,
                  color: circleChildNormalStatusColor,
                  size: circleChildSize,
                ),
              );
        case CustomStepState.error:
          return circleChildCompleteStatus ??
              Center(
                child: Icon(
                  Icons.close,
                  color: circleChildErrorStatusColor,
                  size: circleChildSize,
                ),
              );
        default:
          return Center(
            child: Icon(
              Icons.circle,
              color: circleChildNormalStatusColor,
              size: circleChildSize,
            ),
          );
      }
    }

    /// Builds the cicle/step that show the number of the step.
    Widget _buildCircle(int index) {
      return Container(
        margin: circleMargin,
        width: circleWidth,
        height: circleHeight,
        decoration: steps[index].circleDecoration ??
            circleShapeDecoration ??
            ShapeDecoration(
              color: steps[index].circleColor ?? circleColor,
              shape: steps[index].circleShape ??
                  (!changeStepShape
                      ? CircleBorder(
                          side: BorderSide(
                            color: circleBorderColor,
                          ),
                        )
                      : RoundedRectangleBorder(
                          side: BorderSide(
                            color: circleBorderColor,
                          ),
                        )),
            ),
        child: steps[index].circleChild ??
            circleChild ??
            (showNumbers
                ? Center(
                    child: Text(
                      "$index",
                      style: circleNumbersTextStyle,
                    ),
                  )
                : showCircleChildByState
                    ? _getStateIcon(steps[index].state)
                    : null),
      );
    }

    /// Builds a [Column] that holds the title and subtitle Widget
    /// that will be later initializated.
    Widget _buildHeaderText(int index) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // The title widget.
          AnimatedDefaultTextStyle(
            style: titleTextStyle,
            duration: kThemeAnimationDuration,
            curve: Curves.fastOutSlowIn,
            child: steps[index].title,
          ),
          // The subtitle widget if not null.
          if (steps[index].subtitle != null)
            Container(
              margin: const EdgeInsets.only(top: 4.0),
              child: AnimatedDefaultTextStyle(
                style: subtitleTextStyle,
                duration: kThemeAnimationDuration,
                curve: Curves.fastOutSlowIn,
                child: steps[index].subtitle!,
              ),
            ),
        ],
      );
    }

    /// Builds the full widget that merge the title and subtitle
    /// with the step and his content.
    Widget _buildVerticalHeader(int index) {
      return Container(
        padding: stepPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    // Line parts are always added in order for the ink splash to
                    // flood the tips of the connector lines.
                    _buildCircle(index),
                    _buildLine(!_isLast(index)),
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: textsMargin,
                    padding: textsPadding ??
                        (steps[index].subtitle == null
                            ? const EdgeInsets.only(top: 12.0)
                            : const EdgeInsets.only(top: 6.0)),
                    child: _buildHeaderText(index),
                  ),
                ),
              ],
            ),
            !_isLast(index) && steps[index].endOfLineContent != null
                ? steps[index].endOfLineContent!
                : Container(),
          ],
        ),
      );
    }

    return ListView(
      shrinkWrap: true,
      padding: stepListPadding,
      physics: stepListPhysics,
      children: <Widget>[
        for (int index = 0; index < steps.length; index++)
          _buildVerticalHeader(index),
      ],
    );
  }
}
