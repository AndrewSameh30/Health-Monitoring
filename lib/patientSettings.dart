import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/main.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:first_app/patientProfile.dart';
import 'package:first_app/patientHome.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();
  String doctorMobNo = "";
  String BPmax = "";
  String BPmin = "";
  String HRmax = "";
  String HRmin = "";
  String OSmax = "";
  String OSmin = "";

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _submit() async {
    // you can write your
    // own code according to
    // whatever you want to submit;
    // final url = Uri.https(
    //     'health-monitoring-afb77-default-rtdb.firebaseio.com', 'healthparams.json');
    // _formKey.currentState!.save();
    // http.post(url,
    //     headers: {'Content-Type': 'application/json'},
    //     body: json.encode(_formKey.currentState!.value));

    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Name, email address, and profile photo URL
      // final name = user.displayName;
      // final email = user.email;
      // final photoUrl = user.photoURL;

      // // Check if user's email is verified
      // final emailVerified = user.emailVerified;

      // The user's ID, unique to the Firebase project. Do NOT use this value to
      // authenticate with your backend server, if you have one. Use
      // User.getIdToken() instead.
      final uid = user.uid;

      DatabaseReference patientRef =
          FirebaseDatabase.instance.ref("Patients/$uid");
      print(_formKey.currentState!.value);
      print(patientRef);
      _formKey.currentState!.save();

// Only update the name, leave the age and address!
      await patientRef.update(
        _formKey.currentState!.value,
      );
      context.showFlash(
          barrierColor: Colors.black54,
          barrierDismissible: true,
          builder: (context, controller) => FadeTransition(
            opacity: controller.controller,
            child: AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                side: BorderSide(),
              ),
              contentPadding: EdgeInsets.only(
                  left: 24.0, top: 16.0, right: 24.0, bottom: 16.0),
              title: Text('Settings'),
              content: Text('Your settings have been updated successfully'),
              actions: [
                TextButton(
                  onPressed: controller.dismiss,
                  child: Text('Ok'),
                ),
              ],
            ),
          ),
       );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(24),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  FormBuilderTextField(
                    name: 'doctorMobileNo',
                    decoration:
                        InputDecoration(labelText: 'Doctor Mobile Number'),
                    keyboardType: TextInputType.phone,
                  ),
                  // this is where the
                  // input goes
                  FormBuilderTextField(
                    name: 'RRmax',
                    decoration: InputDecoration(
                        labelText: 'Respiratory Rate safe range(Max)'),
                    keyboardType: TextInputType.number,
                  ),
                  FormBuilderTextField(
                    name: 'RRmin',
                    decoration: InputDecoration(
                        labelText: 'Respiratory Rate safe range(Min)'),
                    keyboardType: TextInputType.number,
                  ),
                  FormBuilderTextField(
                    name: 'HRmax',
                    decoration: InputDecoration(
                        labelText: 'Heart Rate safe range(Max)'),
                    keyboardType: TextInputType.number,
                  ),
                  FormBuilderTextField(
                    name: 'HRmin',
                    decoration: InputDecoration(
                        labelText: 'Heart Rate safe range(Min)'),
                    keyboardType: TextInputType.number,
                  ),
                  FormBuilderTextField(
                    name: 'OSmax',
                    decoration: InputDecoration(
                        labelText: 'Oxygen Saturation safe range(Max)'),
                    keyboardType: TextInputType.number,
                  ),
                  FormBuilderTextField(
                    name: 'OSmin',
                    decoration: InputDecoration(
                        labelText: 'Oxygen Saturation safe range(Min)'),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 152, 34, 172),
                        foregroundColor: Colors.white),
                    onPressed: _submit,
                    child: Text("submit"),
                  ),
                ],
              ),
            ),
          ),
          // this is where
          // the form field
          // are defined
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
