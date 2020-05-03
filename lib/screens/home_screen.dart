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

  Future<ExerciseHub> exerciseHub;

  @override
  void initState() {
    setState(() {
      exerciseHub = getExercises();
    });
    super.initState();
  }

  Future<ExerciseHub> getExercises() async {
    var response = await http.get(apiUrl);
    var body = response.body;

    var decodedJson = jsonDecode(body);

    print(body);

    return decodedJson;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text("HomePage"),
      ),
    );
  }
}
