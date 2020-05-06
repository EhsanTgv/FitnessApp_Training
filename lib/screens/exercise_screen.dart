import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/screens/exercise_hub.dart';
import 'package:flutter/material.dart';

class ExerciseScreen extends StatefulWidget {
  final Exercises exercises;

  ExerciseScreen(this.exercises);

  @override
  State<StatefulWidget> createState() {
    return _ExerciseScreenState();
  }
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CachedNetworkImage(
          imageUrl: widget.exercises.gif,
          placeholder: (context, url) => Image(
            image: AssetImage("assets/placeholder.jpg"),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
