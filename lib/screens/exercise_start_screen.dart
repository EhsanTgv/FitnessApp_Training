import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/screens/exercise_hub.dart';
import 'package:flutter/material.dart';

class ExerciseStartScreen extends StatefulWidget {
  final Exercises exercises;

  ExerciseStartScreen(this.exercises);

  @override
  State<StatefulWidget> createState() {
    return _ExerciseStartScreenState();
  }
}

class _ExerciseStartScreenState extends State<ExerciseStartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Hero(
            tag: widget.exercises.id,
            child: Stack(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: widget.exercises.thumbnail,
                  placeholder: (context, url) => Image(
                    image: AssetImage("assets/placeholder.jpg"),
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF000000),
                        Color(0x00000000),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
