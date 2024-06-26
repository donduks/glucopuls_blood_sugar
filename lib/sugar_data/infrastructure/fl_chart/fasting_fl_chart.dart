import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:glucopuls_2/sugar_data/core/share/providers.dart';

class FastingFlChart extends ConsumerWidget {
  const FastingFlChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(LineChartData(lineBarsData: [])),
    );
  }
}

Widget aspectRatio(ref) {
  final bs = ref.watch(appListViewProvider);

  List<FlSpot> spots = bs
      .fastingDataPage()
      .map((bloodSugar) => FlSpot(bloodSugar['date'], bloodSugar['content']))
      .toList;
  return AspectRatio(
    aspectRatio: 2,
    child: LineChart(
        LineChartData(lineBarsData: [LineChartBarData(spots: spots)])),
  );
}
