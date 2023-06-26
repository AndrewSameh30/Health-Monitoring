import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_app/doctorTabs.dart';
import 'package:first_app/pages/loginDoctor.dart';
import 'package:first_app/pages/login_register_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/auth.dart';

import '../patietntTabs.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? errorMessage = '';
  bool isLogin = true;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  // Future<void> signInWithEmailAndPassword() async {
  //   try {
  //     await Auth().signInWithEmailAndPassword(
  //       email: _controllerEmail.text,
  //       password: _controllerPassword.text,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       errorMessage = e.message;
  //     });
  //   }
  // }

  void _navigateToLoginDoctorPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => patientTabs()));
  }

//with phone
  Future<void> createUserWithEmailAndPassword() async {
    try {
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
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
        // DatabaseReference newPatientParamsRef = patientParamsRef.push();
        patientRef.set({
          'userId': uid,
        });
        print('uid: $uid');
        FirebaseMessaging messaging = FirebaseMessaging.instance;
        NotificationSettings settings = await messaging.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );
        var deviceToken = await messaging.getToken();
        print(deviceToken);
        await patientRef.update({"deviceToken": deviceToken});
        _navigateToLoginDoctorPage(context);
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _title() {
    return const Text('Firebase Auth');
  }

  Widget _entryField(
    String title,
    TextEditingController controller,
  ) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: title,
      ),
    );
  }

  Widget _errorMessage() {
    return Text(errorMessage == '' ? '' : 'Humm ? $errorMessage');
  }

  Widget _submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 152, 34, 172),
      ),
      onPressed: createUserWithEmailAndPassword,
      child: Text('Register'),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        _navigateToLoginDoctorPage(context);
      },
      child: Text('Login here'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Monitoring'),
        backgroundColor: Color.fromARGB(255, 90, 13, 103),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _entryField('Email', _controllerEmail),
            _entryField('Passowrd', _controllerPassword),
            _errorMessage(),
            _submitButton(),
            // _loginOrRegisterButton(),
          ],
        ),
      ),
    );
  }
}
