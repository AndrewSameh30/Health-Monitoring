import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_app/DVpatientParams/dvPatientOxygenSaturation.dart';
import 'package:first_app/DVpatientParams/dvPatientRespiratoryRate.dart';
import 'package:first_app/auth.dart';
import 'package:first_app/patientCalories.dart';
import 'package:first_app/patientHeartRate.dart';
import 'package:first_app/patientHeight.dart';
import 'package:first_app/patientInfo.dart';
import 'package:first_app/patientRespiratoryRate.dart';
import 'package:first_app/patientSteps.dart';
import 'package:first_app/patientWeight.dart';
import 'package:first_app/patietntTabs.dart';
import 'package:flutter/material.dart';
import 'package:first_app/patientSettings.dart';
import 'package:first_app/patientProfile.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_health_connect/flutter_health_connect.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'DVpatientParams/dvPatientCalories.dart';
import 'DVpatientParams/dvPatientHeartRate.dart';
import 'DVpatientParams/dvPatientHeight.dart';
import 'DVpatientParams/dvPatientSteps.dart';
import 'DVpatientParams/dvPatientWeight.dart';
import 'firebase_options.dart';

class PatientParamsPage extends StatefulWidget {
  final String patientId;
  const PatientParamsPage({super.key, required this.patientId});
  @override
  State<PatientParamsPage> createState() => _HomeScreenState();
}

Future signOut() async {
  await Auth().signOut();
}

initializeFireBase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void _navigateToPatientRespiratoryRate(BuildContext context, String patientId) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DVpatientRespiratoryRate(patientId: patientId)));
}

void _navigateToPatientHeartRate(BuildContext context, String patientId) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DVpatientHeartRate(patientId: patientId)));
}

void _navigateToPatientSteps(BuildContext context, String patientId) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DVpatientSteps(patientId: patientId)));
}

void _navigateToPatientCalories(BuildContext context, String patientId) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DVpatientCalories(patientId: patientId)));
}

void _navigateToPatientWeight(BuildContext context, String patientId) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DVpatientWeight(patientId: patientId)));
}

void _navigateToPatientHeight(BuildContext context, String patientId) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DVpatientHeight(patientId: patientId)));
}

void _navigateToPatientInfo(BuildContext context, String patientId) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => PatientInfo(patientId: patientId)));
}

class _HomeScreenState extends State<PatientParamsPage> {
  @override
  void initState() {
    super.initState();
    initializeReading();
  }

  String? heartRate;
  String? respiratoryRate;
  String? steps;
  String? totalCaloriesBurned;
  String? weight;
  String? height;
  String? oxygenSaturation;

  void initializeReading() async {
    try {
      DatabaseReference patientParamsRef =
          FirebaseDatabase.instance.ref("PatientsParams");
      final snapshot = await patientParamsRef.get();
      if (snapshot.exists) {
        Query query = patientParamsRef
            .limitToLast(1)
            .orderByChild("userId")
            .equalTo(widget.patientId);
        final patientParamsSnapshot = await query.get();
        dynamic patientParamsSnapshotValue = patientParamsSnapshot.value;
        setState(() {
          heartRate =
              patientParamsSnapshotValue.values.first["HeartRate"].toString();
        });
        setState(() {
          respiratoryRate = patientParamsSnapshotValue
              .values.first["RespiratoryRate"]
              .toString();
        });
        setState(() {
          steps = patientParamsSnapshotValue.values.first["Steps"].toString();
        });
        setState(() {
          oxygenSaturation =
              patientParamsSnapshotValue.values.first["OxygenSaturation"].toString();
        });
        setState(() {
          weight = patientParamsSnapshotValue.values.first["Weight"].toString();
        });
        setState(() {
          height = patientParamsSnapshotValue.values.first["Height"].toString();
        });
        print(patientParamsSnapshotValue);
      }
    } catch (error) {
      print(error);
    }
  }

  void _submit() {}

  @override
  Widget build(BuildContext context) {
    return
        //You should use `Scaffold` if you have `TextField` in body.
        //Otherwise on focus your `TextField` won`t scroll when keyboard popup.
        Scaffold(
      appBar: AppBar(
        title: Text('Health Monitoring'),
        backgroundColor: Color.fromARGB(255, 90, 13, 103),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 152, 34, 172),
                          foregroundColor: Colors.white,
                          fixedSize: const Size(150, 80)),
                      onPressed: () {
                        _navigateToPatientRespiratoryRate(
                            context, widget.patientId);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Respiratory Rate'),
                          Text("$respiratoryRate rpm"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 152, 34, 172),
                          foregroundColor: Colors.white,
                          fixedSize: const Size(150, 80)),
                      onPressed: () {
                        _navigateToPatientHeartRate(context, widget.patientId);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Heart Rate'),
                          Text("$heartRate bpm"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 152, 34, 172),
                          foregroundColor: Colors.white,
                          fixedSize: const Size(150, 80)),
                      onPressed: () {
                        _navigateToPatientOxygenSaturation(context, widget.patientId);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Oxygen Saturation'),
                          Text("$oxygenSaturation%"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 152, 34, 172),
                          foregroundColor: Colors.white,
                          fixedSize: const Size(150, 80)),
                      onPressed: () {
                        _navigateToPatientSteps(context, widget.patientId);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('No. of Steps'),
                          Text("$steps"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 152, 34, 172),
                          foregroundColor: Colors.white,
                          fixedSize: const Size(150, 80)),
                      onPressed: () {
                        _navigateToPatientWeight(context, widget.patientId);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Weight'),
                          Text('$weight KG'),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 152, 34, 172),
                          foregroundColor: Colors.white,
                          fixedSize: const Size(150, 80)),
                      onPressed: () {
                        _navigateToPatientHeight(context, widget.patientId);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Height'),
                          Text("$height m"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextButton(
                      style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 152, 34, 172),)),
                      onPressed: () {
                        _navigateToPatientInfo(
                            context, widget.patientId);
                      },
                      child: Text('View Patient Information'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  void _navigateToPatientOxygenSaturation(BuildContext context, String patientId) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => DVpatientOxygenSaturation(patientId: patientId)));
  }
}
