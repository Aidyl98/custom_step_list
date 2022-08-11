import 'package:custom_step_list/custom_step_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TravelListExample(),
    );
  }
}

class TravelListExample extends StatelessWidget {
  const TravelListExample({Key? key}) : super(key: key);

  /// Creates a step for a [CustomStepListWidget].
  CustomStep _buildStep({
    required Widget title,
    required Widget subtitle,
    CustomStepState state = CustomStepState.normal,
    Widget? circleChild,
    ShapeBorder? circleShape,
    Widget? endOfLineContent,
  }) {
    return CustomStep(
      // The title of the step that typically describes it.
      title: title,
      // The state of the step which determines the styling of its components
      // and whether steps are interactive.
      state: state,
      // The subtitle of the step that appears below the title and
      // has a smaller font size. It typically gives more details
      // that complement the title.
      subtitle: subtitle,
      // The content of the step that appears inside the circle.
      circleChild: circleChild,
      // To change the shape of a specific step.
      circleShape: circleShape,
      // The content of the step that appears below the line
      // that conect a line with another
      endOfLineContent: endOfLineContent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The color of the [Material] widget that underlies the entire Scaffold.
      backgroundColor: Colors.blue.shade100,
      body: SafeArea(
        child: ListView(
          children: [
            // A text in form of a title/headline for the list.
            const Padding(
              padding: EdgeInsets.only(top: 8.0, left: 30.0, bottom: 8.0),
              child: Text(
                "Travel List:",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Builds a custom Step List Widget.
            CustomStepListWidget(
              // Padding around the list of steps. All the steps.
              stepListPadding: const EdgeInsets.symmetric(horizontal: 12.0),
              // The color that fill the circle.
              circleColor: Colors.blue.shade900,
              // If this bool is set to true it will show a child/icon
              // inside the circle matching the state of the step
              showCircleChildByState: true,
              // To change the color of the child/icon
              // when the state is normal use this property.
              circleChildNormalStatusColor: Colors.blue.shade100,
              // To change the color of the child/icon
              // when the state is complete use this property.
              circleChildCompleteStatusColor: Colors.blue.shade100,
              // The list whit all the steps of the [CustomStepListWidget].
              steps: [
                _buildStep(
                  title: const Text('Eiffel Tower, Paris'),
                  subtitle: const Text(
                    "Anatole France, 75007 Paris, Francia",
                  ),
                  endOfLineContent: const Text(
                    'Distance: 1109.42 kilometers (km)',
                  ),
                  state: CustomStepState.complete,
                ),
                _buildStep(
                  title: const Text('The Colosseum, Rome'),
                  subtitle: const Text(
                    "Piazza del Colosseo, Italia",
                  ),
                  endOfLineContent: const Text(
                    'Distance: 6894.52 kilometers (km)',
                  ),
                  state: CustomStepState.complete,
                ),
                _buildStep(
                  title: const Text('Statue of Liberty, New York City'),
                  subtitle: const Text(
                    "New York, NY 10004",
                  ),
                  endOfLineContent: const Text(
                    'Distance: 5990.25 kilometers (km)',
                  ),
                  state: CustomStepState.error,
                ),
                _buildStep(
                  title: const Text('Machu Picchu, Peru'),
                  subtitle: const Text(
                    "08680, Perú",
                  ),
                  endOfLineContent: const Text(
                    'Distance: 11446.89 kilometers (km)',
                  ),
                  state: CustomStepState.complete,
                ),
                _buildStep(
                  title: const Text('The Acropolis, Athens'),
                  subtitle: const Text(
                    "Athens 105 58, Grecia",
                  ),
                  endOfLineContent: const Text(
                    'Distance: 5155.19 kilometers (km)',
                  ),
                ),
                _buildStep(
                  title: const Text('The Taj Mahal, India'),
                  subtitle: const Text(
                    "Agra, Uttar Pradesh 282001, India",
                  ),
                  endOfLineContent: const Text(
                    'Distance: 4570.38 kilometers (km)',
                  ),
                ),
                _buildStep(
                  title: const Text('Pyramids of Giza, Egypt'),
                  subtitle: const Text(
                    "Al Giza Desert, Giza Governorate 3512201, Egipto",
                  ),
                  circleShape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  circleChild: Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
