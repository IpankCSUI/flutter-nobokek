import "package:flutter/material.dart";
import 'package:flutter_nobokek/widgets/drawer.dart';
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_nobokek/models/stat_money.dart';

class MyStatisticPage extends StatefulWidget {
  const MyStatisticPage({super.key});
  @override
  _MyStatisticPage createState() => _MyStatisticPage();
}

class _MyStatisticPage extends State<MyStatisticPage> {
  @override
  Widget build(BuildContext context) {
    final List<EarningsTimeline> listIncome = [
      EarningsTimeline(week: "01", money: 18.5),
      EarningsTimeline(week: "02", money: 21),
      EarningsTimeline(week: "03", money: 30),
      EarningsTimeline(week: "04", money: 38),
    ];

    final List<EarningsTimeline> listOutcome = [
      EarningsTimeline(week: "01", money: 15),
      EarningsTimeline(week: "02", money: 20),
      EarningsTimeline(week: "03", money: 25),
      EarningsTimeline(week: "04", money: 30),
    ];

    final List<EarningsTimeline> listTarget = [
      EarningsTimeline(week: "01", money: 20),
      EarningsTimeline(week: "02", money: 10),
      EarningsTimeline(week: "03", money: 21),
      EarningsTimeline(week: "04", money: 5),
    ];

    List<charts.Series<EarningsTimeline, String>> timeline = [
      charts.Series(
      id: "Subscribers",
      data: listIncome,
        domainFn: (EarningsTimeline timeline, _) => timeline.week,
        measureFn: (EarningsTimeline timeline, _) => timeline.money,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        fillColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      )
    ];

    List<charts.Series<EarningsTimeline, String>> timeline2 = [
      charts.Series(
      id: "Subscribers",
      data: listOutcome,
        domainFn: (EarningsTimeline timeline2, _) => timeline2.week,
        measureFn: (EarningsTimeline timeline2, _) => timeline2.money,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        fillColorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
      )
    ];

    List<charts.Series<EarningsTimeline, String>> timeline3 = [
      charts.Series(
      id: "Subscribers",
      data: listTarget,
        domainFn: (EarningsTimeline timeline3, _) => timeline3.week,
        measureFn: (EarningsTimeline timeline3, _) => timeline3.money,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        fillColorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      )
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Statistic")),
      body: Center(
        child: Container(
          height: 700,
          padding: const EdgeInsets.all(40),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  const Text(
                    "Hello, User!",
                  ),
                  const Text(
                    "Your Statistic",
                  ),
                  Expanded(
                    child: charts.BarChart(timeline, animate: true),
                  ),
                  Expanded(
                    child: charts.BarChart(timeline2, animate: true),
                  ),
                  Expanded(
                    child: charts.BarChart(timeline3, animate: true),
                  ),
                  const Text(
                    "Minggu Ke ",
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
