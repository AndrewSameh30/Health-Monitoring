import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:fl_chart_app/presentation/resources/app_resources.dart';

class DVpatientCalories extends StatefulWidget {
      final String patientId;

  const DVpatientCalories({super.key,required this.patientId});

  @override
  State<DVpatientCalories> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DVpatientCalories> {
  late List<RRdata> _chartData = [];
  @override
  void initState() {
    super.initState();
    initializeReading();
  }

  void initializeReading() async {
    
      DatabaseReference patientParamsRef =
          FirebaseDatabase.instance.ref("PatientsParams");
      final snapshot = await patientParamsRef.get();
      if (snapshot.exists) {
        dynamic patientParams = snapshot.value;
        print(patientParams);
        // DatabaseReference patientsRef =
        //     FirebaseDatabase.instance.ref("Patients");
        Query query =
            patientParamsRef.limitToLast(15).orderByChild("userId").equalTo(widget.patientId);
        final patientParamsSnapshot = await query.get();
        dynamic patientParamsSnapshotValue = patientParamsSnapshot.value;
        print(patientParamsSnapshotValue.values.first["Calories"]);
        print(patientParamsSnapshotValue.values.first["Time"]);

        print(patientParamsSnapshotValue.values.length);
        dynamic last5params = patientParamsSnapshotValue.values;
        print(last5params.map((e) => double.parse('${e["Calories"]}')));
        setState(() {
          _chartData = last5params
              .map<RRdata>((e) => RRdata(DateTime.parse(e["Time"]),
                  double.parse('${e["Calories"]}')))
                  .toList();
              _chartData.sort((RRdata a, RRdata b) => a.x.compareTo(b.x));
        });
        print('pp:$_chartData');

        // List<dynamic>last5Time = last5params.map((e) => ).toList();

        // print('last5RR:$last5RR');
      }
    
  }

  List<Color> gradientColors = [
    Colors.cyan,
    Colors.blue,
  ];

  bool showAvg = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health Monitoring'),
        backgroundColor: Color.fromARGB(255, 90, 13, 103),
      ),
      body: SfCartesianChart(
        title: ChartTitle(text: 'No. of Calories Burnt(Last 15 records)'),
        // legend: Legend(isVisible: true),
        series: <ChartSeries>[
          LineSeries<RRdata, DateTime>(
            dataSource: _chartData,
            xValueMapper: (RRdata rr, _) => rr.x,
            yValueMapper: (RRdata rr, _) => rr.y,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
            ),
          ),
        ],
        primaryXAxis: DateTimeAxis(
            // labelFormat: '{value}',
            edgeLabelPlacement: EdgeLabelPlacement.shift),
        primaryYAxis: NumericAxis(labelFormat: '{value}cal'),
      ),
    );
  }

  // List<RRdata> getChartData() {
  //   final List<RRdata> chartData = [
  //     RRdata(, ),
  //     RRdata(2, 2),
  //     RRdata(3, 3),
  //     RRdata(4, 1),
  //     RRdata(5, 4),
  //   ];
  //   return chartData;
  // }
}

class RRdata {
  RRdata(this.x, this.y);
  final DateTime x;
  final double y;
}

