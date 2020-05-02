import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnboardingScreenState();
  }
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var pages = [
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset("assets/screen1.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Colors.blue,
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset("assets/screen2.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Colors.blue,
      ),
    ),
    PageViewModel(
      title: "Title of first page",
      body:
          "Here you can write the description of the page, to explain someting...",
      image: Center(child: Image.asset("assets/screen3.png", height: 175.0)),
      decoration: const PageDecoration(
        pageColor: Colors.blue,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: pages,
        onDone: () {
          // When done button is press
        },
        onSkip: () {
          // You can also override onSkip callback
        },
        showSkipButton: true,
        skip: Icon(Icons.skip_next),
        next: Icon(Icons.arrow_right),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            activeColor: Colors.deepOrange,
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
