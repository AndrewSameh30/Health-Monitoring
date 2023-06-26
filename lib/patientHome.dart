import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_app/auth.dart';
import 'package:first_app/patientCalories.dart';
import 'package:first_app/patientHeartRate.dart';
import 'package:first_app/patientHeight.dart';
import 'package:first_app/patientOxygenSaturation.dart';
import 'package:first_app/patientRespiratoryRate.dart';
import 'package:first_app/patientSteps.dart';
import 'package:first_app/patientWeight.dart';
import 'package:first_app/patietntTabs.dart';
import 'package:first_app/pages/userType.dart';
import 'package:flutter/material.dart';
import 'package:first_app/patientSettings.dart';
import 'package:first_app/patientProfile.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_health_connect/flutter_health_connect.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import 'firebase_options.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future signOut(context) async {
  await Auth().signOut();
  _navigateToUserType(context);
}

initializeFireBase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void _navigateToUserType(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => UserType()));
}

void _navigateToPatientRespiratoryRate(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PatientRespiratoryRate()));
}

void _navigateToPatientHeartRate(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PatientHeartRate()));
}

void _navigateToPatientSteps(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PatientSteps()));
}

void _navigateToPatientCalories(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PatientCalories()));
}

void _navigateToPatientWeight(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PatientWeight()));
}

void _navigateToPatientHeight(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => PatientHeight()));
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    initializeReading();
  }

  var StepsCount;
  var CaloriesCount;
  var HeartRateCount;
  var WeightCount;
  var HeightCount;
  var RespiratoryRateCount;
  var OxygenSaturationCount;
  num totalSteps = 0;

  void initializeReading() async {
    final types = [
      HealthConnectDataType.Steps,
      HealthConnectDataType.BloodPressure,
      HealthConnectDataType.HeartRate,
      HealthConnectDataType.Weight,
      HealthConnectDataType.Height,
      HealthConnectDataType.TotalCaloriesBurned,
      HealthConnectDataType.ActiveCaloriesBurned,
      HealthConnectDataType.RespiratoryRate,
      HealthConnectDataType.OxygenSaturation,

      // HealthDataType.BASAL_ENERGY_BURNED,
    ];
    // final healthTypes = [
    //   HealthDataType.STEPS,
    //   HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
    //   HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
    //   HealthDataType.HEART_RATE,
    //   HealthDataType.WEIGHT,
    //   HealthDataType.HEIGHT,
    //   HealthDataType.ACTIVE_ENERGY_BURNED,
    //   HealthDataType.BASAL_ENERGY_BURNED,

    //   // HealthDataType.BASAL_ENERGY_BURNED,
    // ];
    try {
      // HealthFactory health = HealthFactory();

      // final healthPermissions = healthTypes.map((e) => HealthDataAccess.READ).toList();

      // await health.requestAuthorization(healthTypes, permissions: healthPermissions);

      await Permission.activityRecognition.request();
      await Permission.location.request();

      final now = DateTime.now();
      final yesterday = now.subtract(Duration(days: 30));

      final yesterdaySteps = now.subtract(
          Duration(hours: now.hour, minutes: now.minute, seconds: now.second));

      final yesterdayCalories = now.subtract(Duration(hours: 10));

      var result = await HealthConnectFactory.hasPermissions(
        types,
      );

      var permissions = await HealthConnectFactory.requestPermissions(types);
      print(permissions);

      var steps = await HealthConnectFactory.getRecord(
        type: HealthConnectDataType.Steps,
        startTime: yesterdaySteps,
        endTime: now,
      );

      var weight = await HealthConnectFactory.getRecord(
        type: HealthConnectDataType.Weight,
        startTime: yesterday,
        endTime: now,
      );
      var height = await HealthConnectFactory.getRecord(
        type: HealthConnectDataType.Height,
        startTime: yesterday,
        endTime: now,
      );
      var heartRate = await HealthConnectFactory.getRecord(
        type: HealthConnectDataType.HeartRate,
        startTime: yesterday,
        endTime: now,
      );
      var totalCaloriesBurned = await HealthConnectFactory.getRecord(
        type: HealthConnectDataType.TotalCaloriesBurned,
        startTime: yesterdaySteps,
        endTime: now,
      );
      var respiratoryRate = await HealthConnectFactory.getRecord(
        type: HealthConnectDataType.RespiratoryRate,
        startTime: yesterday,
        endTime: now,
      );
      var oxygenSaturation = await HealthConnectFactory.getRecord(
        type: HealthConnectDataType.OxygenSaturation,
        startTime: yesterday,
        endTime: now,
      );

      setState(() {
        if (steps["records"].length > 0)
          StepsCount = steps["records"][0]["count"];
      });

      setState(() {
        if (weight["records"].length > 0)
          WeightCount = weight["records"]?[weight["records"].length - 1]
                  ?["weight"]["kilograms"]
              .toStringAsFixed(1);
      });
      setState(() {
        if (heartRate["records"].length > 0)
          HeartRateCount = heartRate["records"]
                  ?[(heartRate["records"].length) - 1]?["samples"]?[0]
              ?["beatsPerMinute"];
      });
      setState(() {
        if (height["records"].length > 0)
          HeightCount = height["records"]?[height["records"].length - 1]
                  ?["height"]?["meters"]
              .toStringAsFixed(2);
      });
      setState(() {
        if (totalCaloriesBurned["records"].length > 0)
          CaloriesCount = totalCaloriesBurned["records"]
                      ?[totalCaloriesBurned["records"].length - 1]?["energy"]
                  ?["calories"]
              .round();
      });
      setState(() {
        if (respiratoryRate["records"].length > 0)
          RespiratoryRateCount = respiratoryRate["records"]
                  ?[respiratoryRate["records"].length - 1]?["rate"]
              .round();
      });
      setState(() {
        print(oxygenSaturation);
        if (oxygenSaturation["records"].length > 0)
          OxygenSaturationCount = oxygenSaturation["records"]
                      ?[oxygenSaturation["records"].length - 1]?["percentage"]
                  ?["value"]
              .round();
      });

      steps["records"].toList().forEach((record) {
        totalSteps = totalSteps + record["count"];
        // print(record);
      });

      num totalCalories = 0;
      totalCaloriesBurned["records"]?.toList().forEach((record) {
        totalCalories = totalCalories + record["energy"]["calories"];
        // print(totalCalories);
      });
      print(totalSteps);
      // print(totalCaloriesBurned["records"]
      //     ?[totalCaloriesBurned["records"].length - 1]?["energy"]);
      // print(height);
      // print(heartRate);
      //print(activeCaloriesBurned);
      // print(steps);

      // FirebaseDatabase database = FirebaseDatabase.instance;
      // database.ref("patientParams").;
      await initializeFireBase();
      final user = FirebaseAuth.instance.currentUser;
      print("user$user");
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
        //  DateTime dnow = DateTime.now();
        // print("date $dnow");
        final uid = user.uid;
        DatabaseReference patientParamsRef =
            FirebaseDatabase.instance.ref("PatientsParams");
        final snapshot1 = await patientParamsRef.get();
        if (snapshot1.exists) {
          Query query = patientParamsRef
              .limitToLast(1)
              .orderByChild("userId")
              .equalTo(uid);
          final patientParamsSnapshot = await query.get();
          dynamic patientParamsSnapshotValue = patientParamsSnapshot.value;
          String? RR = patientParamsSnapshotValue
              .values.first["RespiratoryRate"]
              .toString();
          String? HR =
              patientParamsSnapshotValue.values.first["HeartRate"].toString();
          String? OS = patientParamsSnapshotValue
              .values.first["OxygenSaturation"]
              .toString();
          String? St = patientParamsSnapshotValue
              .values.first["Steps"]
              .toString();
          String? We = patientParamsSnapshotValue
              .values.first["Weight"]
              .toString();
          String? He = patientParamsSnapshotValue
              .values.first["Height"]
              .toString();
          print(patientParamsSnapshotValue);
          if (RR != RespiratoryRateCount.toString() ||
              HR != HeartRateCount.toString() ||
              OS != OxygenSaturationCount.toString() ||
              St != totalSteps.toString() ||
              We != WeightCount.toString() ||
              He != HeightCount.toString()
              ) {
            DatabaseReference newPatientParamsRef = patientParamsRef.push();
            newPatientParamsRef.set({
              'Time': now.toString(),
              'userId': uid,
              'RespiratoryRate': RespiratoryRateCount,
              'HeartRate': HeartRateCount,
              'Calories': totalCalories,
              'Steps': totalSteps,
              'Weight': WeightCount,
              'Height': HeightCount,
              'OxygenSaturation': OxygenSaturationCount,
            });
          }
        } else {
          DatabaseReference newPatientParamsRef = patientParamsRef.push();
          newPatientParamsRef.set({
            'Time': now.toString(),
            'userId': uid,
            'RespiratoryRate': RespiratoryRateCount,
            'HeartRate': HeartRateCount,
            'Calories': totalCalories,
            'Steps': totalSteps,
            'Weight': WeightCount,
            'Height': HeightCount,
            'OxygenSaturation': OxygenSaturationCount,
          });
        }
        DatabaseReference patientRef =
            FirebaseDatabase.instance.ref("Patients/$uid");
        final snapshot = await patientRef.get();
        print(uid);

        print("snapshot:${snapshot.exists}");
        if (snapshot.exists) {
          dynamic patient = snapshot.value;
          print(patient["HRmax"]);
          DatabaseReference doctorsRef =
              FirebaseDatabase.instance.ref("Doctor");
          Query query = doctorsRef
              .orderByChild("doctorMobNo")
              .equalTo(patient["doctorMobileNo"]);
          final doctorSnapshot = await query.get();
          print(doctorSnapshot);
          if (doctorSnapshot.exists) {
            Map<dynamic, dynamic> doctors = doctorSnapshot.value as dynamic;
            String doctorDeviceToken = doctors.values.first["deviceToken"];
            print(doctorDeviceToken);
            print(doctorSnapshot.value);
            print(doctors.values);
            // FirebaseMessaging messaging = FirebaseMessaging.instance;
            // await messaging.sendMessage(
            //   to: doctorDeviceToken,
            //   data: {
            //     "title": "test Title",
            //     "body": "Test body",
            //   },
            // );
            print("token:$doctorDeviceToken");
            // final url =
            //     Uri.https('sendpushnotification-rqx4al2xkq-uc.a.run.app');
            // http.post(
            //   url,/json'},
            //   body: json.encode({
            //     'token': doctorDeviceToken,
            //   headers: {'Content-Type': 'application
            //     'message': "Patient params out of safe range",
            //   }),
            // );
            print(RespiratoryRateCount);
            print(HeartRateCount);
            var prrmax = patient["RRmax"];
            print(prrmax);
            var prrmin = patient["RRmin"];
            print(prrmin);
            var phrmax = patient["HRmax"];
            print(phrmax);
            var phrmin = patient["HRmin"];
            print(phrmin);

            if (num.tryParse("$RespiratoryRateCount")! >
                    num.tryParse("$prrmax")! &&
                num.tryParse("$HeartRateCount")! > num.tryParse("$phrmax")!) {
              final dio = Dio();
              final response = await dio.post(
                'https://sendpushnotification-rqx4al2xkq-uc.a.run.app',
                data: {
                  "token": doctorDeviceToken,
                  "message":
                      "${patient['patientName']} respiratory rate & heart rate are above safe range",
                },
              );
              print("response:$response");
            } else if (num.tryParse("$RespiratoryRateCount")! >
                    num.tryParse("$prrmax")! &&
                num.tryParse("$HeartRateCount")! < num.tryParse("$phrmin")!) {
              print('aaaaaaaaaaa');

              final dio = Dio();
              final response = await dio.post(
                'https://sendpushnotification-rqx4al2xkq-uc.a.run.app',
                data: {
                  "token": doctorDeviceToken,
                  "message":
                      "${patient['patientName']} respiratory rate is above safe range & heart rate is below safe range",
                },
              );
              print("response:$response");
            } else if (num.tryParse("$RespiratoryRateCount")! <
                    num.tryParse("$prrmin")! &&
                num.tryParse("$HeartRateCount")! > num.tryParse("$phrmax")!) {
              final dio = Dio();
              final response = await dio.post(
                'https://sendpushnotification-rqx4al2xkq-uc.a.run.app',
                data: {
                  "token": doctorDeviceToken,
                  "message":
                      "${patient['patientName']} respiratory rate is below safe range & heart rate is above safe range",
                },
              );
              print("response:$response");
            } else if (num.tryParse("$RespiratoryRateCount")! <
                    num.tryParse("$prrmin")! &&
                num.tryParse("$HeartRateCount")! < num.tryParse("$phrmin")!) {
              print('aaaaaaaaaaa');

              final dio = Dio();
              final response = await dio.post(
                'https://sendpushnotification-rqx4al2xkq-uc.a.run.app',
                data: {
                  "token": doctorDeviceToken,
                  "message":
                      "${patient['patientName']} respiratory rate & heart rate are below safe range",
                },
              );
              print("response:$response");
            } else if (num.tryParse("$RespiratoryRateCount")! >
                num.tryParse("$prrmax")!) {
              final dio = Dio();
              final response = await dio.post(
                'https://sendpushnotification-rqx4al2xkq-uc.a.run.app',
                data: {
                  "token": doctorDeviceToken,
                  "message":
                      "${patient['patientName']} respiratory rate is above safe range",
                },
              );
              print("response:$response");
            } else if (num.tryParse("$RespiratoryRateCount")! <
                num.tryParse("$prrmin")!) {
              print('aaaaaaaaaaa');

              final dio = Dio();
              final response = await dio.post(
                'https://sendpushnotification-rqx4al2xkq-uc.a.run.app',
                data: {
                  "token": doctorDeviceToken,
                  "message":
                      "${patient['patientName']} respiratory rate is below safe range",
                },
              );
              print("response:$response");
            } else if (num.tryParse("$HeartRateCount")! >
                num.tryParse("$phrmax")!) {
              final dio = Dio();
              final response = await dio.post(
                'https://sendpushnotification-rqx4al2xkq-uc.a.run.app',
                data: {
                  "token": doctorDeviceToken,
                  "message":
                      "${patient['patientName']} heart rate is above safe range",
                },
              );
              print("response:$response");
            } else if (num.tryParse("$HeartRateCount")! <
                num.tryParse("$phrmin")!) {
              final dio = Dio();
              final response = await dio.post(
                'https://sendpushnotification-rqx4al2xkq-uc.a.run.app',
                data: {
                  "token": doctorDeviceToken,
                  "message":
                      "${patient['patientName']} heart rate is below safe range",
                },
              );
              print("response:$response");
            }
            // dio.options.contentType = Headers.formUrlEncodedContentType;
            // // or only works once
            // dio.post(
            //   '/info',
            //   data: {'id': 5},
            //   options: Options(contentType: Headers.formUrlEncodedContentType),
            // );
            // final http.Response response = await http.post(
            //   url,
            //   headers: <String, String>{
            //     'Content-Type':
            //         'application/x-www-form-urlencoded; charset=UTF-8',
            //   },
            //   body: "hi",
            // );
          }
        } else {
          print('No data available.');
        }
        print(uid);
        // dynamic patient = (await patientRef.once()).snapshot.value;
        // patient?["HRmax"];
        // print(patient?.HRmax);
        // print(newPatientParamsRef.key);
        // final url = Uri.https(
        //     'health-monitoring-afb77-default-rtdb.firebaseio.com',
        //     'patientParams.json');
        // http.post(
        //   url,
        //   headers: {'Content-Type': 'application/json'},
        //   body: json.encode({
        //     'Heart Rate': HeartRateCount,
        //     'Calories': CaloriesCount,
        //     'Steps': StepsCount,
        //     'Weight': WeightCount,
        //     'Height': HeightCount,
        //   }),
        // );
      }
      // print(steps);
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
        Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //Header Container

        //Body Container
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:
                  // <Widget>[
                  //   Container(
                  //     color: Colors.white,
                  //     height: 200.0,
                  //     alignment: Alignment.center,
                  //     child: Text("Content 1"),
                  //   ),
                  //   //TextField nearly at bottom
                  //   TextField(
                  //     //decoration: Input
                  //     ),
                  // ],
                  [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: SizedBox(
                        width: 150.0,
                        height: 150.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 152, 34, 172),
                              foregroundColor: Colors.white),
                          onPressed: () {
                            _navigateToPatientRespiratoryRate(context);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Respiratory Rate'),
                              Text("$RespiratoryRateCount rpm"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: SizedBox(
                        width: 150.0,
                        height: 150.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 152, 34, 172),
                              foregroundColor: Colors.white),
                          onPressed: () {
                            _navigateToPatientHeartRate(context);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Heart Rate'),
                              Text("$HeartRateCount bpm"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: SizedBox(
                        width: 150.0,
                        height: 150.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 152, 34, 172),
                              foregroundColor: Colors.white),
                          onPressed: () {
                            _navigateToPatientOxygenSaturation(context);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Oxygen Sat.'),
                              Text("$OxygenSaturationCount%"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: SizedBox(
                        width: 150.0,
                        height: 150.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 152, 34, 172),
                              foregroundColor: Colors.white),
                          onPressed: () {
                            _navigateToPatientSteps(context);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('No. of Steps'),
                              Text("$totalSteps"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      child: SizedBox(
                        width: 150.0,
                        height: 150.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 152, 34, 172),
                              foregroundColor: Colors.white),
                          onPressed: () {
                            _navigateToPatientWeight(context);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Weight'),
                              Text('$WeightCount KG'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(5),
                      child: SizedBox(
                        width: 150.0,
                        height: 150.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 152, 34, 172),
                              foregroundColor: Colors.white),
                          onPressed: () {
                            _navigateToPatientHeight(context);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Height'),
                              Text("$HeightCount m"),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 152, 34, 172),
                  ),
                  onPressed: () {
                    signOut(context);
                  },
                  child: const Text('Sign Out'),
                )
              ],
            ),
          ),
        ),

        //Footer Container
        //Here you will get unexpected behaviour when keyboard pops-up.
        //So its better to use `bottomNavigationBar` to avoid this.
      ],
    );
  }

  void _navigateToPatientOxygenSaturation(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PatientOxygenSaturation()));
  }
}
