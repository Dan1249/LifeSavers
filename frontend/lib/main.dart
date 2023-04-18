import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/ui/home/home.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'LifeSavers'),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(30.0),
              child: const Icon(Icons.account_circle, size: 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              )),
          Container(
            padding: EdgeInsets.all(5.0),
            alignment: Alignment.center,
            child: Text("Patient Name/ Number"),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Text("Status"),
          ),
        ],
      ),
    );
  }
}

Future<Patient> fetchPatient() async {
  //maybe feed in the user id later idk
  const url =
      '***REMOVED***/GetPatientData?UserId=BHL33M';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Patient patient = Patient.fromJson(jsonResponse['data']);
    return patient;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

class Patient {
  final String userId;
  final String avatarImage;
  final String fullName;
  final String longitude;
  final String latitude;
  final String dateTime;
  final double heartRate;
  final double steps;
  final String sleepStatus;

  const Patient({
    required this.userId,
    required this.avatarImage,
    required this.fullName,
    required this.longitude,
    required this.latitude,
    required this.dateTime,
    required this.heartRate,
    required this.steps,
    required this.sleepStatus,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      userId: json['UserId'],
      avatarImage: json['AvatarImage'],
      fullName: json['FullName'],
      longitude: json['Longitude'],
      latitude: json['Latitude'],
      dateTime: json['DateTime'],
      heartRate: json['HeartRate'],
      steps: json['Steps'],
      sleepStatus: json['SleepStatus'],
    );
  }
}
