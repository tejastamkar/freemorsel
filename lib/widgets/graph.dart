// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y, this.y1);
  final String x;
  final double? y;
  final double? y1;
}

class BarChart extends StatelessWidget {
  const BarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = <ChartData>[
      ChartData('W1', 128, 92),
      ChartData('W2', 123, 92),
      ChartData('W3', 107, 106),
      ChartData('W4', 87, 95),
      ChartData('W5', 87, 80),
    ];
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
