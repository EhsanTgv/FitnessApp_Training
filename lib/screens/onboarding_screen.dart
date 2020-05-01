import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnboardingScreenState();
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness App"),
      ),
      body: Center(
        child: Text("Fitness App"),
      ),
    );
  }
}
