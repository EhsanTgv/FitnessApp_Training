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
        title: Text("Fitness App"),
      ),
      body: Container(
        child: exerciseHub != null
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(16)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: FadeInImage(
                        image: NetworkImage(
                            exerciseHub.exercises[index].thumbnail),
                        placeholder: AssetImage("assets/placeholder.jpg"),
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: exerciseHub.exercises.length,
              )
            : LinearProgressIndicator(),
      ),
    );
  }
}
