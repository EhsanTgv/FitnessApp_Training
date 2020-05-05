import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitnessapp/screens/exercise_hub.dart';
import 'package:fitnessapp/screens/exercise_start_screen.dart';
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
            ? ListView(
                children: exerciseHub.exercises.map(
                  (exercise) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ExerciseStartScreen(exercise)));
                      },
                      child: Hero(
                        tag: exercise.id,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)),
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: CachedNetworkImage(
                                  imageUrl: exercise.thumbnail,
                                  placeholder: (context, url) => Image(
                                    image: AssetImage("assets/placeholder.jpg"),
                                    fit: BoxFit.cover,
                                    height: 250,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                  fit: BoxFit.cover,
                                  height: 250,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 250,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Color(0xff000000),
                                          Color(0x00000000)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.center),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.bottomLeft,
                                height: 250,
                                child: Text(
                                  exercise.title,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ).toList(),
              )
            : LinearProgressIndicator(),
      ),
    );
  }
}
