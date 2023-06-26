// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';

// import 'package:first_app/gradient_container.dart';
// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: GradientContainer(
//           Color.fromARGB(255, 33, 5, 109),
//           Color.fromARGB(255, 68, 21, 149),
//         ),
//       ),
//     ),
//   );
// }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';

// import '../screens/places.dart';

// final colorScheme = ColorScheme.fromSeed(
//   brightness: Brightness.dark,
//   seedColor: const Color.fromARGB(255, 102, 6, 247),
//   background: const Color.fromARGB(255, 56, 49, 66),
// );

// final theme = ThemeData().copyWith(
//   useMaterial3: true,
//   scaffoldBackgroundColor: colorScheme.background,
//   colorScheme: colorScheme,
//   textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
//     titleSmall: GoogleFonts.ubuntuCondensed(
//       fontWeight: FontWeight.bold,
//     ),
//     titleMedium: GoogleFonts.ubuntuCondensed(
//       fontWeight: FontWeight.bold,
//     ),
//     titleLarge: GoogleFonts.ubuntuCondensed(
//       fontWeight: FontWeight.bold,
//     ),
//   ),
// );

// void main() {
//   runApp(
//     const ProviderScope(child: MyApp()),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Great Places',
//       theme: theme,
//       home: const PlacesScreen(),
//     );
//   }
// }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_health_connect/flutter_health_connect.dart';
// import 'package:health/health.dart';
// //import 'package:health_example/util.dart';
// import 'package:permission_handler/permission_handler.dart';
// //import 'package:device_info/device_info.dart';

// void main() => runApp(HealthApp());

// class HealthApp extends StatefulWidget {
//   @override
//   _HealthAppState createState() => _HealthAppState();
// }

// enum AppState {
//   DATA_NOT_FETCHED,
//   FETCHING_DATA,
//   DATA_READY,
//   NO_DATA,
//   AUTHORIZED,
//   AUTH_NOT_GRANTED,
//   DATA_ADDED,
//   DATA_DELETED,
//   DATA_NOT_ADDED,
//   DATA_NOT_DELETED,
//   STEPS_READY,
// }

// class _HealthAppState extends State<HealthApp> {
//   List<HealthDataPoint> _healthDataList = [];
//   AppState _state = AppState.DATA_NOT_FETCHED;
//   int _nofSteps = 0;
//   // Define the types to get.
//   // NOTE: These are only the ones supported on Androids new API Health Connect.
//   // Both Android's Google Fit and iOS' HealthKit have more types that we support in the enum list [HealthDataType]
//   // Add more - like AUDIOGRAM, HEADACHE_SEVERE etc. to try them.
//   //static final types = dataTypesAndroid;
//   // Or selected types
//   static final types = [
//     // HealthDataType.WEIGHT,
//     HealthDataType.STEPS,
//     HealthDataType.BODY_TEMPERATURE,
//     HealthDataType.HEART_RATE,
//     HealthDataType.WEIGHT,
//     HealthDataType.HEIGHT,

//     // HealthDataType.Sl,
//     // HealthDataType.STEPS,
//     // HealthDataType.STEPS,

//     // HealthDataType.HEIGHT,
//     // HealthDataType.BLOOD_GLUCOSE,
//     // HealthDataType.WORKOUT,
//     // HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
//     // HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
//     // Uncomment these lines on iOS - only available on iOS
//     // HealthDataType.AUDIOGRAM
//   ];

//   // with coresponsing permissions
//   // READ only
//   final permissions = types.map((e) => HealthDataAccess.READ).toList();
//   // Or READ and WRITE
//   // final permissions = types.map((e) => HealthDataAccess.READ_WRITE).toList();

//   // create a HealthFactory for use in the app
//   HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

//   Future authorize() async {
//     // If we are trying to read Step Count, Workout, Sleep or other data that requires
//     // the ACTIVITY_RECOGNITION permission, we need to request the permission first.
//     // This requires a special request authorization call.
//     //
//     // The location permission is requested for Workouts using the Distance information.
//     //////////////////////////////////////////////////////////////////////////////////////
//     await Permission.activityRecognition.request();
//     await Permission.location.request();

//     // Check if we have permission
//     bool? hasPermissions =
//         await health.hasPermissions(types, permissions: permissions);

//     // hasPermissions = false because the hasPermission cannot disclose if WRITE access exists.
//     // Hence, we have to request with WRITE as well.
//     hasPermissions = false;

//     bool authorized = false;
//     if (!hasPermissions) {
//       // requesting access to the data types before reading them
//       authorized =
//           await health.requestAuthorization(types, permissions: permissions);
//     }

//     setState(() => _state =
//         (authorized) ? AppState.AUTHORIZED : AppState.AUTH_NOT_GRANTED);
//   }

//   /// Fetch data points from the health plugin and show them in the app.
//   Future fetchData() async {
//     setState(() => _state = AppState.FETCHING_DATA);

//     // get data within the last 24 hours
//     final now = DateTime.now();
//     final yesterday = now.subtract(Duration(hours: 24));

//     // Clear old data points
//     _healthDataList.clear();

//     try {
//       // fetch health data
//       //List<HealthDataPoint> healthData =
//           //await health.getHealthDataFromTypes(yesterday, now, types);
//           var results = await HealthConnectFactory.getRecord(
//                   type:     HealthConnectDataType.Steps,
//                   startTime: yesterday,
//                   endTime: now,
//                 );
//                 print(results);
//       // save all the new data points (only the first 100)
//       // _healthDataList.addAll(
//       //     (healthData.length < 100) ? healthData : healthData.sublist(0, 100));
//     } catch (error) {
//       print("Exception in getHealthDataFromTypes: $error");
//     }

//     // filter out duplicates
//     _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

//     // print the results
//     _healthDataList.forEach((x) => print(x));

//     // update the UI to display the results
//     setState(() {
//       _state = _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
//     });
//   }

//   /// Add some random health data.
//   Future addData() async {
//     final now = DateTime.now();
//     final earlier = now.subtract(Duration(minutes: 20));

//     // Add data for supported types
//     // NOTE: These are only the ones supported on Androids new API Health Connect.
//     // Both Android's Google Fit and iOS' HealthKit have more types that we support in the enum list [HealthDataType]
//     // Add more - like AUDIOGRAM, HEADACHE_SEVERE etc. to try them.
//     bool success = true;
//     success &= await health.writeHealthData(
//         10, HealthDataType.BODY_FAT_PERCENTAGE, earlier, now);
//     success &= await health.writeHealthData(
//         1.925, HealthDataType.HEIGHT, earlier, now);
//     success &=
//         await health.writeHealthData(90, HealthDataType.WEIGHT, earlier, now);
//     success &= await health.writeHealthData(
//         90, HealthDataType.HEART_RATE, earlier, now);
//     success &=
//         await health.writeHealthData(90, HealthDataType.STEPS, earlier, now);
//     success &= await health.writeHealthData(
//         200, HealthDataType.ACTIVE_ENERGY_BURNED, earlier, now);
//     success &= await health.writeHealthData(
//         70, HealthDataType.HEART_RATE, earlier, now);
//     success &= await health.writeHealthData(
//         37, HealthDataType.BODY_TEMPERATURE, earlier, now);
//     success &= await health.writeHealthData(
//         98, HealthDataType.BLOOD_OXYGEN, earlier, now);
//     success &= await health.writeHealthData(
//         105, HealthDataType.BLOOD_GLUCOSE, earlier, now);
//     success &= await health.writeHealthData(
//         1100, HealthDataType.DISTANCE_DELTA, earlier, now);
//     success &=
//         await health.writeHealthData(1.8, HealthDataType.WATER, earlier, now);
//     success &= await health.writeWorkoutData(
//         HealthWorkoutActivityType.AMERICAN_FOOTBALL,
//         now.subtract(Duration(minutes: 15)),
//         now,
//         totalDistance: 2430,
//         totalEnergyBurned: 400);
//     success &= await health.writeBloodPressure(90, 80, earlier, now);

//     // Store an Audiogram
//     // Uncomment these on iOS - only available on iOS
//     // const frequencies = [125.0, 500.0, 1000.0, 2000.0, 4000.0, 8000.0];
//     // const leftEarSensitivities = [49.0, 54.0, 89.0, 52.0, 77.0, 35.0];
//     // const rightEarSensitivities = [76.0, 66.0, 90.0, 22.0, 85.0, 44.5];

//     // success &= await health.writeAudiogram(
//     //   frequencies,
//     //   leftEarSensitivities,
//     //   rightEarSensitivities,
//     //   now,
//     //   now,
//     //   metadata: {
//     //     "HKExternalUUID": "uniqueID",
//     //     "HKDeviceName": "bluetooth headphone",
//     //   },
//     // );

//     setState(() {
//       _state = success ? AppState.DATA_ADDED : AppState.DATA_NOT_ADDED;
//     });
//   }

//   /// Delete some random health data.
//   Future deleteData() async {
//     final now = DateTime.now();
//     final earlier = now.subtract(Duration(hours: 24));

//     bool success = true;
//     for (HealthDataType type in types) {
//       success &= await health.delete(type, earlier, now);
//     }

//     setState(() {
//       _state = success ? AppState.DATA_DELETED : AppState.DATA_NOT_DELETED;
//     });
//   }

//   /// Fetch steps from the health plugin and show them in the app.
//   Future fetchStepData() async {
//     int? steps;

//     // get steps for today (i.e., since midnight)
//     final now = DateTime.now();
//     final midnight = DateTime(now.year, now.month, now.day);

//     bool requested = await health.requestAuthorization([HealthDataType.STEPS]);

//     if (requested) {
//       try {
//         steps = await health.getTotalStepsInInterval(midnight, now);
//       } catch (error) {
//         print("Caught exception in getTotalStepsInInterval: $error");
//       }

//       print('Total number of steps: $steps');

//       setState(() {
//         _nofSteps = (steps == null) ? 0 : steps;
//         _state = (steps == null) ? AppState.NO_DATA : AppState.STEPS_READY;
//       });
//     } else {
//       print("Authorization not granted - error in authorization");
//       setState(() => _state = AppState.DATA_NOT_FETCHED);
//     }
//   }

//   Future revokeAccess() async {
//     await health.revokePermissions();
//   }

//   Widget _contentFetchingData() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//             padding: EdgeInsets.all(20),
//             child: CircularProgressIndicator(
//               strokeWidth: 10,
//             )),
//         Text('Fetching data...')
//       ],
//     );
//   }

//   Widget _contentDataReady() {
//     return ListView.builder(
//         itemCount: _healthDataList.length,
//         itemBuilder: (_, index) {
//           HealthDataPoint p = _healthDataList[index];
//           if (p.value is AudiogramHealthValue) {
//             return ListTile(
//               title: Text("${p.typeString}: ${p.value}"),
//               trailing: Text('${p.unitString}'),
//               subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
//             );
//           }
//           if (p.value is WorkoutHealthValue) {
//             return ListTile(
//               title: Text(
//                   "${p.typeString}: ${(p.value as WorkoutHealthValue).totalEnergyBurned} ${(p.value as WorkoutHealthValue).totalEnergyBurnedUnit?.name}"),
//               trailing: Text(
//                   '${(p.value as WorkoutHealthValue).workoutActivityType.name}'),
//               subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
//             );
//           }
//           return ListTile(
//             title: Text("${p.typeString}: ${p.value}"),
//             trailing: Text('${p.unitString}'),
//             subtitle: Text('${p.dateFrom} - ${p.dateTo}'),
//           );
//         });
//   }

//   Widget _contentNoData() {
//     return Text('No Data to show');
//   }

//   Widget _contentNotFetched() {
//     return Column(
//       children: [
//         Text('Press the download button to fetch data.'),
//         Text('Press the plus button to insert some random data.'),
//         Text('Press the walking button to get total step count.'),
//       ],
//       mainAxisAlignment: MainAxisAlignment.center,
//     );
//   }

//   Widget _authorized() {
//     return Text('Authorization granted!');
//   }

//   Widget _authorizationNotGranted() {
//     return Text('Authorization not given. '
//         'For Android please check your OAUTH2 client ID is correct in Google Developer Console. '
//         'For iOS check your permissions in Apple Health.');
//   }

//   Widget _dataAdded() {
//     return Text('Data points inserted successfully!');
//   }

//   Widget _dataDeleted() {
//     return Text('Data points deleted successfully!');
//   }

//   Widget _stepsFetched() {
//     return Text('Total number of steps: $_nofSteps');
//   }

//   Widget _dataNotAdded() {
//     return Text('Failed to add data');
//   }

//   Widget _dataNotDeleted() {
//     return Text('Failed to delete data');
//   }

//   Widget _content() {
//     if (_state == AppState.DATA_READY)
//       return _contentDataReady();
//     else if (_state == AppState.NO_DATA)
//       return _contentNoData();
//     else if (_state == AppState.FETCHING_DATA)
//       return _contentFetchingData();
//     else if (_state == AppState.AUTHORIZED)
//       return _authorized();
//     else if (_state == AppState.AUTH_NOT_GRANTED)
//       return _authorizationNotGranted();
//     else if (_state == AppState.DATA_ADDED)
//       return _dataAdded();
//     else if (_state == AppState.DATA_DELETED)
//       return _dataDeleted();
//     else if (_state == AppState.STEPS_READY)
//       return _stepsFetched();
//     else if (_state == AppState.DATA_NOT_ADDED)
//       return _dataNotAdded();
//     else if (_state == AppState.DATA_NOT_DELETED)
//       return _dataNotDeleted();
//     else
//       return _contentNotFetched();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Health Example'),
//         ),
//         body: Container(
//           child: Column(
//             children: [
//               Wrap(
//                 spacing: 10,
//                 children: [
//                   TextButton(
//                       onPressed: authorize,
//                       child:
//                           Text("Auth", style: TextStyle(color: Colors.white)),
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStatePropertyAll(Colors.blue))),
//                   TextButton(
//                       onPressed: fetchData,
//                       child: Text("Fetch Data",
//                           style: TextStyle(color: Colors.white)),
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStatePropertyAll(Colors.blue))),
//                   TextButton(
//                       onPressed: addData,
//                       child: Text("Add Data",
//                           style: TextStyle(color: Colors.white)),
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStatePropertyAll(Colors.blue))),
//                   TextButton(
//                       onPressed: deleteData,
//                       child: Text("Delete Data",
//                           style: TextStyle(color: Colors.white)),
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStatePropertyAll(Colors.blue))),
//                   TextButton(
//                       onPressed: fetchStepData,
//                       child: Text("Fetch Step Data",
//                           style: TextStyle(color: Colors.white)),
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStatePropertyAll(Colors.blue))),
//                   TextButton(
//                       onPressed: revokeAccess,
//                       child: Text("Revoke Access",
//                           style: TextStyle(color: Colors.white)),
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStatePropertyAll(Colors.blue))),
//                 ],
//               ),
//               Divider(thickness: 3),
//               Expanded(child: Center(child: _content()))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_health_connect/flutter_health_connect.dart';
// import 'package:device_info/device_info.dart';
// // import 'package:http/http.dart' as http;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<HealthConnectDataType> types = [
//     HealthConnectDataType.ActiveCaloriesBurned,
//     HealthConnectDataType.BasalBodyTemperature,
//     HealthConnectDataType.BasalMetabolicRate,
//     HealthConnectDataType.BloodGlucose,
//     HealthConnectDataType.BloodPressure,
//     HealthConnectDataType.BodyFat,
//     HealthConnectDataType.BodyTemperature,
//     HealthConnectDataType.BoneMass,
//     HealthConnectDataType.CervicalMucus,
//     HealthConnectDataType.CyclingPedalingCadence,
//     HealthConnectDataType.Distance,
//     HealthConnectDataType.ElevationGained,
//     HealthConnectDataType.ExerciseSession,
//     HealthConnectDataType.FloorsClimbed,
//     HealthConnectDataType.HeartRate,
//     HealthConnectDataType.Height,
//     HealthConnectDataType.Hydration,
//     HealthConnectDataType.LeanBodyMass,
//     HealthConnectDataType.MenstruationFlow,
//     HealthConnectDataType.Nutrition,
//     HealthConnectDataType.OvulationTest,
//     HealthConnectDataType.OxygenSaturation,
//     HealthConnectDataType.Power,
//     HealthConnectDataType.RespiratoryRate,
//     HealthConnectDataType.RestingHeartRate,
//     HealthConnectDataType.SexualActivity,
//     HealthConnectDataType.SleepSession,
//     HealthConnectDataType.SleepStage,
//     HealthConnectDataType.Speed,
//     HealthConnectDataType.StepsCadence,
//     HealthConnectDataType.Steps,
//     HealthConnectDataType.TotalCaloriesBurned,
//     HealthConnectDataType.Vo2Max,
//     HealthConnectDataType.Weight,
//     HealthConnectDataType.WheelchairPushes,
//   ];

//   // List<HealthConnectDataType> types = [
//   //   HealthConnectDataType.Steps,
//   //   HealthConnectDataType.ExerciseSession,
//   //   // HealthConnectDataType.HeartRate,
//   //   // HealthConnectDataType.SleepSession,
//   //   // HealthConnectDataType.OxygenSaturation,
//   //   // HealthConnectDataType.RespiratoryRate,
//   // ];

//   bool readOnly = true;
//   String resultText = '';

//   String token = "";

//   String name1 = "Diego";
//   double temp1 = 37.2;
//   int pulserate1 = 70;
//   int bgl1 = 150;

//   String name2 = "Diego";
//   double temp2 = 37.8;
//   int pulserate2 = 70;
//   int bgl2 = 150;

//   String name3 = "Diego";
//   double temp3 = 38.3;
//   int pulserate3 = 70;
//   int bgl3 = 150;

//   String name4 = "Diego";
//   double temp4 = 39;
//   int pulserate4 = 70;
//   int bgl4 = 150;

//   // void _func() async{
//   //   final url = Uri.https('flutter-health-16f15-default-rtdb.firebaseio.com',
//   //       'health-params.json');
//   //   final response = await http.post(url, headers: {
//   //     'Content-Type': 'application/json'
//   //   }, body: json.encode(
//   //       {
//   //         'name':name2,
//   //         'temperature':temp2,
//   //         'pulserate':pulserate2,
//   //         'bloodglucoselevel':bgl2,
//   //       },
//   //     ),
//   //   );
//   //   print(response.body);
//   //   print(response.statusCode);

//   //   if(!context.mounted){
//   //     return;
//   //   }
//   //   Navigator.of(context).pop();
//   // }
//   // void _func1() async{
//   //   final url = Uri.https('flutter-health-16f15-default-rtdb.firebaseio.com',
//   //       'health-params.json');
//   //   final response = await http.get(url
//   //   );
//   //   print(response.body);
//   // }

//   void _loadItems() async{
//     final url = Uri.https('flutter-health-16f15-default-rtdb.firebaseio.com',
//         'health-params.json');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Health Connect'),
//         ),
//         body: ListView(
//           padding: const EdgeInsets.all(16),
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 var result = await HealthConnectFactory.isApiSupported();
//                 resultText = 'isApiSupported: $result';
//                 _updateResultText();
//               },
//               child: const Text('isApiSupported'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 var result = await HealthConnectFactory.isAvailable();
//                 resultText = 'isAvailable: $result';
//                 _updateResultText();
//               },
//               child: const Text('Check installed'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await HealthConnectFactory.installHealthConnect();
//                   resultText = 'Install activity started';
//                 } catch (e) {
//                   resultText = e.toString();
//                 }
//                 _updateResultText();
//               },
//               child: const Text('Install Health Connect'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   await HealthConnectFactory.openHealthConnectSettings();
//                   resultText = 'Settings activity started';
//                 } catch (e) {
//                   resultText = e.toString();
//                 }
//                 _updateResultText();
//               },
//               child: const Text('Open Health Connect Settings'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 var result = await HealthConnectFactory.hasPermissions(
//                   types,
//                   readOnly: readOnly,
//                 );
//                 resultText = 'hasPermissions: $result';
//                 _updateResultText();
//               },
//               child: const Text('Has Permissions'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   token = await HealthConnectFactory.getChangesToken(types);
//                   resultText = 'token: $token';
//                 } catch (e) {
//                   resultText = e.toString();
//                 }
//                 _updateResultText();
//               },
//               child: const Text('Get Changes Token'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   var result = await HealthConnectFactory.getChanges(token);
//                   resultText = 'token: $result';
//                 } catch (e) {
//                   resultText = e.toString();
//                 }
//                 _updateResultText();
//               },
//               child: const Text('Get Changes'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 try {
//                   var result = await HealthConnectFactory.requestPermissions(
//                     types,
//                     readOnly: readOnly,
//                   );
//                   resultText = 'requestPermissions: $result';
//                 } catch (e) {
//                   resultText = e.toString();
//                 }
//                 _updateResultText();
//               },
//               child: const Text('Request Permissions'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 var startTime =
//                     DateTime.now().subtract(const Duration(days: 4));
//                 var endTime = DateTime.now();
//                 try {
//                   final requests = <Future>[];
//                   Map<String, dynamic> typePoints = {};
//                   for (var type in types) {
//                     requests.add(HealthConnectFactory.getRecord(
//                       type: type,
//                       startTime: startTime,
//                       endTime: endTime,
//                     ).then((value) => typePoints.addAll({type.name: value})));
//                   }
//                   await Future.wait(requests);
//                   resultText = '$typePoints';
//                 } catch (e) {
//                   resultText = e.toString();
//                 }
//                 _updateResultText();
//               },
//               child: const Text('Get Record'),
//             ),
//             // ElevatedButton(onPressed: _func,child: Text('Press here'),),
//             Text(resultText),
//           ],
//         ),
//       ),
//     );
//   }

//   void _updateResultText() {
//     setState(() {});
//   }
// }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final TextEditingController _numberCtrl = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _numberCtrl.text = "085921191121";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: TextField(
//                 controller: _numberCtrl,
//                 decoration: const InputDecoration(labelText: "Phone Number"),
//                 keyboardType: TextInputType.number,
//               ),
//             ),
//             ElevatedButton(
//               child: const Text("Test Call"),
//               onPressed: () async {
//                 FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_sms/flutter_sms.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late TextEditingController _controllerPeople, _controllerMessage;
//   String? _message, body;
//   String _canSendSMSMessage = 'Check is not run.';
//   List<String> people = [];
//   bool sendDirect = false;

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   Future<void> initPlatformState() async {
//     _controllerPeople = TextEditingController();
//     _controllerMessage = TextEditingController();
//   }

//   Future<void> _sendSMS(List<String> recipients) async {
//     try {
//       String _result = await sendSMS(
//         message: _controllerMessage.text,
//         recipients: recipients,
//         sendDirect: sendDirect,
//       );
//       setState(() => _message = _result);
//     } catch (error) {
//       setState(() => _message = error.toString());
//     }
//   }

//   Future<bool> _canSendSMS() async {
//     bool _result = await canSendSMS();
//     setState(() => _canSendSMSMessage =
//         _result ? 'This unit can send SMS' : 'This unit cannot send SMS');
//     return _result;
//   }

//   Widget _phoneTile(String name) {
//     return Padding(
//       padding: const EdgeInsets.all(3),
//       child: Container(
//           decoration: BoxDecoration(
//               border: Border(
//             bottom: BorderSide(color: Colors.grey.shade300),
//             top: BorderSide(color: Colors.grey.shade300),
//             left: BorderSide(color: Colors.grey.shade300),
//             right: BorderSide(color: Colors.grey.shade300),
//           )),
//           child: Padding(
//             padding: const EdgeInsets.all(4),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 IconButton(
//                   icon: const Icon(Icons.close),
//                   onPressed: () => setState(() => people.remove(name)),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(0),
//                   child: Text(
//                     name,
//                     textScaleFactor: 1,
//                     style: const TextStyle(fontSize: 12),
//                   ),
//                 )
//               ],
//             ),
//           )),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('SMS/MMS Example'),
//         ),
//         body: ListView(
//           children: <Widget>[
//             if (people.isEmpty)
//               const SizedBox(height: 0)
//             else
//               SizedBox(
//                 height: 90,
//                 child: Padding(
//                   padding: const EdgeInsets.all(3),
//                   child: ListView(
//                     scrollDirection: Axis.horizontal,
//                     children: List<Widget>.generate(people.length, (int index) {
//                       return _phoneTile(people[index]);
//                     }),
//                   ),
//                 ),
//               ),
//             ListTile(
//               leading: const Icon(Icons.people),
//               title: TextField(
//                 controller: _controllerPeople,
//                 decoration:
//                     const InputDecoration(labelText: 'Add Phone Number'),
//                 keyboardType: TextInputType.number,
//                 onChanged: (String value) => setState(() {}),
//               ),
//               trailing: IconButton(
//                 icon: const Icon(Icons.add),
//                 onPressed: _controllerPeople.text.isEmpty
//                     ? null
//                     : () => setState(() {
//                           people.add(_controllerPeople.text.toString());
//                           _controllerPeople.clear();
//                         }),
//               ),
//             ),
//             const Divider(),
//             ListTile(
//               leading: const Icon(Icons.message),
//               title: TextField(
//                 decoration: const InputDecoration(labelText: 'Add Message'),
//                 controller: _controllerMessage,
//                 onChanged: (String value) => setState(() {}),
//               ),
//             ),
//             const Divider(),
//             ListTile(
//               title: const Text('Can send SMS'),
//               subtitle: Text(_canSendSMSMessage),
//               trailing: IconButton(
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 icon: const Icon(Icons.check),
//                 onPressed: () {
//                   _canSendSMS();
//                 },
//               ),
//             ),
//             SwitchListTile(
//                 title: const Text('Send Direct'),
//                 subtitle: const Text(
//                     'Should we skip the additional dialog? (Android only)'),
//                 value: sendDirect,
//                 onChanged: (bool newValue) {
//                   setState(() {
//                     sendDirect = newValue;
//                   });
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(8),
//               child: ElevatedButton(
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.resolveWith(
//                       (states) => Theme.of(context).colorScheme.secondary),
//                   padding: MaterialStateProperty.resolveWith(
//                       (states) => const EdgeInsets.symmetric(vertical: 16)),
//                 ),
//                 onPressed: () {
//                   _send();
//                 },
//                 child: Text(
//                   'SEND',
//                   style: Theme.of(context).textTheme.displayMedium,
//                 ),
//               ),
//             ),
//             Visibility(
//               visible: _message != null,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Expanded(
//                     child: Padding(
//                       padding: const EdgeInsets.all(12),
//                       child: Text(
//                         _message ?? 'No Data',
//                         maxLines: null,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _send() {
//     if (people.isEmpty) {
//       setState(() => _message = 'At Least 1 Person or Message Required');
//     } else {
//       _sendSMS(people);
//     }
//   }
// }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

import 'package:first_app/pages/login_register_page.dart';
import 'package:first_app/patientRespiratoryRate.dart';
import 'package:first_app/patietntTabs.dart';
import 'package:first_app/pages/userType.dart';
import 'package:flutter/material.dart';
import 'package:first_app/patientSettings.dart';
import 'package:first_app/patientProfile.dart';

import 'doctorTabs.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:first_app/widget_tree.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  initializeFireBase();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
  var deviceToken= await messaging.getToken();
  print(deviceToken);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');

    if(message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
  runApp(MyApp());
}

initializeFireBase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserType(),
      // home: LoginPage(),
      // home: PatientRespiratoryRate(),
    );
  }
}
