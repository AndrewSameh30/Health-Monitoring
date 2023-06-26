import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_app/DVpatientParams/dvPatientRespiratoryRate.dart';
import 'package:first_app/auth.dart';
import 'package:first_app/patientCalories.dart';
import 'package:first_app/patientHeartRate.dart';
import 'package:first_app/patientHeight.dart';
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
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class PatientInfo extends StatefulWidget {
  final String patientId;
  const PatientInfo({super.key, required this.patientId});
  @override
  State<PatientInfo> createState() => _HomeScreenState();
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

class _HomeScreenState extends State<PatientInfo> {
  @override
  void initState() {
    super.initState();
    initializeReading();
  }

  String? patientName;
  String? patientAge;
  String? patientGender;
  String? patientAddress;
  String? patientMobNo;
  String? RRmax;
  String? RRmin;
  String? HRmax;
  String? HRmin;
  String? OSmax;
  String? OSmin;

  void initializeReading() async {
    try {
      DatabaseReference patientRef = FirebaseDatabase.instance.ref("Patients");
      final snapshot = await patientRef.get();
      if (snapshot.exists) {
        print('aaaaaaaa');
        Query query = patientRef
            .limitToLast(1)
            .orderByChild("userId")
            .equalTo(widget.patientId);
        final patientSnapshot = await query.get();

        dynamic patientSnapshotValue = patientSnapshot.value;

        print('patientSnapshotValue$patientSnapshot');
        setState(() {
          patientName =
              patientSnapshotValue.values.first["patientName"].toString();
        });
        print('ddddddddd');
        print('patName:$patientName');
        setState(() {
          patientAge =
              patientSnapshotValue.values.first["patientAge"].toString();
        });
        setState(() {
          patientGender =
              patientSnapshotValue.values.first["patientGender"].toString();
        });
        setState(() {
          patientAddress =
              patientSnapshotValue.values.first["patientAddress"].toString();
        });
        setState(() {
          patientMobNo =
              patientSnapshotValue.values.first["patientMobNo"].toString();
        });
        setState(() {
          RRmax = patientSnapshotValue.values.first["RRmax"].toString();
        });
        setState(() {
          RRmin = patientSnapshotValue.values.first["RRmin"].toString();
        });
        setState(() {
          HRmax = patientSnapshotValue.values.first["HRmax"].toString();
        });
        setState(() {
          HRmin = patientSnapshotValue.values.first["HRmin"].toString();
        });
        setState(() {
          OSmax = patientSnapshotValue.values.first["OSmax"].toString();
        });
        setState(() {
          OSmin = patientSnapshotValue.values.first["OSmin"].toString();
        });
        print(patientSnapshotValue);
      }
    } catch (error) {
      print(error);
    }
  }

  _callNumber() async {
    String? number = patientMobNo; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number!);
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Patient Information',
                    style: TextStyle(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Card(
                      color: Color.fromARGB(255, 245, 230, 255),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Patient Name: $patientName"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Patient Age: $patientAge"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Patient Gender: $patientGender"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Patient Address: $patientAddress"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Patient Mobile No.: $patientMobNo"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                "Respiratory Rate Safe Range(Max): $RRmax"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                                "Respiratory Rate Safe Range(Min): $RRmin"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Heart Rate Safe Range(Max): $HRmax"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Heart Rate Safe Range(Min): $HRmin"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Oxygen Saturation Safe Range(Max): $OSmax"),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text("Oxygen Saturation Safe Range(Min): $OSmin"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 152, 34, 172),
                              foregroundColor: Colors.white),
                              onPressed: _callNumber,
                              child: Text('Call Patient'),
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
}
