import 'package:first_app/pages/loginDoctor.dart';
import 'package:first_app/patietntTabs.dart';
import 'package:first_app/widget_tree.dart';
import 'package:first_app/widget_treeDoctor.dart';
import 'package:flutter/material.dart';
import 'package:first_app/patientSettings.dart';
import 'package:first_app/patientProfile.dart';
import '../doctorTabs.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserType extends StatelessWidget {
  void _navigateToPatientView(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WidgetTree()));
  }

  void _navigateToDoctorView(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => WidgetTreeDoctor()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Health Monitoring'),
          backgroundColor: Color.fromARGB(255, 90, 13, 103),
        ),
        body: Align(
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 90, 13, 103),
                  ),
                  child: const Text(
                    'Login as a patient',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  onPressed: () {
                    _navigateToPatientView(context);
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 90, 13, 103),
                  ),
                  child: const Text(
                    'Login as a doctor',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  onPressed: () {
                    _navigateToDoctorView(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
