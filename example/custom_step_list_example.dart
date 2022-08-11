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
      home: const CustomStepListExample(),
    );
  }
}

class CustomStepListExample extends StatelessWidget {
  const CustomStepListExample({Key? key}) : super(key: key);

  CustomStep _buildStep({
    required Widget title,
    CustomStepState state = CustomStepState.normal,
    Widget? circleChild,
  }) {
    return CustomStep(
      title: title,
      state: state,
      subtitle: const Text("Subtitle"),
      circleChild: circleChild,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: CustomStepListWidget(
          stepListPadding: const EdgeInsets.all(16.0),
          circleColor: Colors.blue,
          showCircleChildByState: true,
          steps: [
            _buildStep(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Some Title'),
                  Text(
                    "Some Info",
                  ),
                ],
              ),
              circleChild: const Center(
                child: Text("1"),
              ),
            ),
            _buildStep(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Some Title'),
                  Text(
                    "Some Info",
                  ),
                ],
              ),
              state: CustomStepState.complete,
            ),
            _buildStep(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Some Title'),
                  Text(
                    "Some Info",
                  ),
                ],
              ),
              state: CustomStepState.error,
            ),
          ],
        ),
      ),
    );
  }
}
