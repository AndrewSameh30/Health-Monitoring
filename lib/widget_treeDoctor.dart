import 'package:first_app/auth.dart';
import 'package:first_app/doctorTabs.dart';
import 'package:first_app/pages/home_page.dart';
import 'package:first_app/pages/loginDoctor.dart';
import 'package:first_app/pages/login_register_page.dart';
import 'package:first_app/patietntTabs.dart';
import 'package:flutter/material.dart';

class WidgetTreeDoctor extends StatefulWidget {
  const WidgetTreeDoctor({Key? key}) : super(key:key);

  @override
  State<WidgetTreeDoctor> createState() => _WidgetTreeDoctorState();
}

class _WidgetTreeDoctorState extends State<WidgetTreeDoctor> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder:(context, snapshot) {
        if(snapshot.hasData) {
          return doctorTabs();
        } else {
          return const LoginDoctorPage();
        }
      },
    );
  }
}
