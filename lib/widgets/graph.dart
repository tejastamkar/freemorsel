import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y, this.y1);
  final String x;
  final double? y;
  final double? y1;
}

class BarChart extends StatefulWidget {
  const BarChart({Key? key}) : super(key: key);

  @override
  State<BarChart> createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  final List<ChartData> chartData = <ChartData>[
    ChartData('W1', 2, 1),
    ChartData('W2', 0, 1),
    ChartData('W3', 2, 16),
    ChartData('W4', 7, 9),
  ];

  callApi() async {
    // await FirebaseFirestore.instance.collection("").get()
  }
  @override
  void initState() {
    callApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        backgroundColor: Colors.transparent,
        primaryXAxis: CategoryAxis(),
        palette: const <Color>[
          Color.fromRGBO(106, 140, 175, 1),
          Color.fromRGBO(117, 183, 158, 1),
        ],
        series: <CartesianSeries>[
          ColumnSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y),
          ColumnSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y1),
        ]);
  }
}
