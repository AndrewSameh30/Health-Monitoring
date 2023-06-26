import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:first_app/main.dart';
import 'package:flash/flash_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:first_app/patientHome.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class doctorProfile extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<doctorProfile> {
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
      final uid = user.uid;

      DatabaseReference doctorRef =
          FirebaseDatabase.instance.ref("Doctor/$uid");
      print(_formKey.currentState!.value);
      print(doctorRef);
      _formKey.currentState!.save();

// Only update the name, leave the age and address!
      await doctorRef.update(
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
    // return Padding(
    //   padding: const EdgeInsets.only(bottom: 10.0),
    //   child: MaterialButton(
    //     color: Colors.green,
    //     minWidth: double.infinity,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(30.0),
    //     ),
    //     onPressed: () {
    //       CoolAlert.show(
    //         context: context,
    //         type: CoolAlertType.success,
    //         text: 'Transaction completed successfully!',
    //         autoCloseDuration: const Duration(seconds: 2),
    //       );
    //     },
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 15.0),
    //       child: Text(
    //         "OK",
    //         style: const TextStyle(
    //           color: Colors.white,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }

  // AlertDialog alert = AlertDialog(
  //   title: Text("My title"),
  //   content: Text("This is my message."),
  //   actions: [
  //     TextButton(
  //       child: Text("OK"),
  //       onPressed: () {},
  //     ),
  //   ],
  // );

  @override
  Widget build(BuildContext context) {
    // Widget _buildButton(
    //   {VoidCallback? onTap, required String text, Color? color}) {
    // return Padding(
    //   padding: const EdgeInsets.only(bottom: 10.0),
    //   child: MaterialButton(
    //     color: color,
    //     minWidth: double.infinity,
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(30.0),
    //     ),
    //     onPressed: onTap,
    //     child: Padding(
    //       padding: const EdgeInsets.symmetric(vertical: 15.0),
    //       child: Text(
    //         text,
    //         style: const TextStyle(
    //           color: Colors.white,
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    //   }
    // final successAlert = _buildButton(
    //   onTap: () {
    //     CoolAlert.show(
    //       context: context,
    //       type: CoolAlertType.success,
    //       text: 'Transaction completed successfully!',
    //       autoCloseDuration: const Duration(seconds: 2),
    //     );
    //   },
    //   text: 'Success',
    //   color: Colors.green,
    // );
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
                    name: 'doctorMobNo',
                    decoration:
                        InputDecoration(labelText: 'Doctor Mobile Number'),
                    keyboardType: TextInputType.phone,
                  ),
                  // this is where the
                  // input goes
                  FormBuilderTextField(
                    name: 'doctorName',
                    decoration: InputDecoration(labelText: 'Doctor Name'),
                    keyboardType: TextInputType.text,
                  ),
                  FormBuilderTextField(
                    name: 'doctorAge',
                    decoration: InputDecoration(labelText: 'Doctor Age'),
                    keyboardType: TextInputType.number,
                  ),
                  FormBuilderTextField(
                    name: 'doctorGender',
                    decoration: InputDecoration(labelText: 'Doctor Gender'),
                    keyboardType: TextInputType.text,
                  ),
                  FormBuilderTextField(
                    name: 'doctorAddress',
                    decoration: InputDecoration(labelText: 'Doctor Address'),
                    keyboardType: TextInputType.text,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 152, 34, 172),
                        foregroundColor: Colors.white),
                    onPressed: _submit,
                    child: Text("submit"),
                  ),
                  // alert,
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
          // successAlert,
        ],
      ),
    );
  }
}
