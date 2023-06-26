import 'package:first_app/auth.dart';
import 'package:first_app/pages/home_page.dart';
import 'package:first_app/pages/login_register_page.dart';
import 'package:first_app/patietntTabs.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({Key? key}) : super(key:key);

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder:(context, snapshot) {
        if(snapshot.hasData) {
          return patientTabs();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
