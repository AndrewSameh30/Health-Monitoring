import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/main.dart';
import 'package:first_app/patientSettings.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:first_app/patientHome.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  Future<void> _submit() async {
    // you can write your
    // own code according to
    // whatever you want to submit;
    // final url = Uri.https(
    //     'health-monitoring-afb77-default-rtdb.firebaseio.com', 'patients.json');
    // _formKey.currentState!.save();
    // http.post(url,
    //     headers: {'Content-Type': 'application/json'},
    //     body: json.encode(
    //       _formKey.currentState!.value
    //     ));
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
              title: Text('Profile'),
              content: Text('Your profile has been updated successfully'),
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
                    name: 'patientMobNo',
                    decoration:
                        InputDecoration(labelText: 'Patient Mobile Number'),
                    keyboardType: TextInputType.phone,
                  ),
                  // this is where the
                  // input goes
                  FormBuilderTextField(
                    name: 'patientName',
                    decoration: InputDecoration(labelText: 'Patient Name'),
                    keyboardType: TextInputType.text,
                  ),
                  FormBuilderTextField(
                    name: 'patientAge',
                    decoration: InputDecoration(labelText: 'Patient Age'),
                    keyboardType: TextInputType.number,
                  ),
                  FormBuilderTextField(
                    name: 'patientGender',
                    decoration: InputDecoration(labelText: 'Patient Gender'),
                    keyboardType: TextInputType.text,
                  ),
                  FormBuilderTextField(
                    name: 'patientAddress',
                    decoration: InputDecoration(labelText: 'Patient Address'),
                    keyboardType: TextInputType.text,
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
