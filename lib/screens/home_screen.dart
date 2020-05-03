import 'dart:convert';

import 'package:fitnessapp/screens/exercise_hub.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final String apiUrl =
      "https://raw.githubusercontent.com/codeifitech/fitness-app/master/exercises.json";

  ExerciseHub exerciseHub;

  @override
  void initState() {
    getExercises();

    super.initState();
  }

  void getExercises() async {
    var response = await http.get(apiUrl);
    var body = response.body;

    var decodedJson = jsonDecode(body);

    exerciseHub = ExerciseHub.fromJson(decodedJson);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Container(
        child: exerciseHub != null
            ? ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              child: Text("Text"),
            );
          },
          itemCount: exerciseHub.exercises.length,
        )
            : LinearProgressIndicator(),
      ),
    );
  }
}
