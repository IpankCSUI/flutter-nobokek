import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';
import 'package:flutter_nobokek/function/api.dart';
import 'package:flutter_nobokek/models/stat_money.dart';
import 'package:flutter_nobokek/models/money.dart';
import 'package:flutter_nobokek/widgets/yellow_button.dart';
import 'package:flutter_nobokek/widgets/statistic_target.dart';

class MyStatisticPage extends StatefulWidget {
  const MyStatisticPage({super.key});

  @override
  _MyStatisticPage createState() => _MyStatisticPage();
}

//  
class _MyStatisticPage extends State<MyStatisticPage> {
  @override
  Widget build(BuildContext context) {
    double income1 = 18.5;
    double income2 = 15;
    double income3 = 30;
    double income4 = 38;
    double outcome1 = 15;
    double outcome2 = 20;
    double outcome3 = 25;
    double outcome4 = 30;
    double target1 = 0;
    double target2 = 0;
    double target3 = 0;
    double target4 = 0;
    final List<EarningsTimeline> listIncome = [
      EarningsTimeline(week: "Minggu-1", money: income1),
      EarningsTimeline(week: "Minggu-2", money: income2),
      EarningsTimeline(week: "Minggu-3", money: income3),
      EarningsTimeline(week: "Minggu-4", money: income4),
    ];

    final List<EarningsTimeline> listOutcome = [
      EarningsTimeline(week: "Minggu-1", money: outcome1),
      EarningsTimeline(week: "Minggu-2", money: outcome2),
      EarningsTimeline(week: "Minggu-3", money: outcome3),
      EarningsTimeline(week: "Minggu-4", money: outcome4),
    ];

    final List<EarningsTimeline> listSelisih = [
      EarningsTimeline(week: "Minggu-1", money: income1 - outcome1),
      EarningsTimeline(week: "Minggu-2", money: income2 - outcome2),
      EarningsTimeline(week: "Minggu-3", money: income3 - outcome3),
      EarningsTimeline(week: "Minggu-4", money: income4 - outcome4),
    ];

    final List<EarningsTimeline> listTarget = [
      EarningsTimeline(week: "Minggu-1", money: target1),
      EarningsTimeline(week: "Minggu-2", money: target2),
      EarningsTimeline(week: "Minggu-3", money: target3),
      EarningsTimeline(week: "Minggu-4", money: target4),
    ];

    List<charts.Series<EarningsTimeline, String>> timeline = [
      charts.Series(
      id: "Income",
      data: listIncome,
        domainFn: (EarningsTimeline timeline, _) => timeline.week,
        measureFn: (EarningsTimeline timeline, _) => timeline.money,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        fillColorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      ),
      charts.Series(
      id: "Outcome",
      data: listOutcome,
        domainFn: (EarningsTimeline timeline, _) => timeline.week,
        measureFn: (EarningsTimeline timeline, _) => timeline.money,
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        fillColorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
      ),
      charts.Series(
      id: "Subscribers",
      data: listSelisih,
        domainFn: (EarningsTimeline timeline, _) => timeline.week,
        measureFn: (EarningsTimeline timeline, _) => timeline.money,
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        fillColorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
      ),
      charts.Series(
      id: "Subscribers",
      data: listTarget,
        domainFn: (EarningsTimeline timeline, _) => timeline.week,
        measureFn: (EarningsTimeline timeline, _) => timeline.money,
        colorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
        fillColorFn: (_, __) => charts.MaterialPalette.yellow.shadeDefault,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyStatisticPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Statistic'),
      ),
      body: Center(
        child: Container(
          height: 1500,
          padding: const EdgeInsets.all(40),
          color: ColorPalettes.freshLemon,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                    future: NoBokekApi.fetchUsername(context),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        return Text(
                          'Hello, ${snapshot.data}!',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: 23, fontWeight: FontWeight.bold),
                        );
                      } else if (snapshot.connectionState == ConnectionState.done &&
                          !snapshot.hasData) {
                        return const Text(
                            "Gagal mendapatkan data username pengguna.");
                      } else {
                        return const Text("Sedang mendapatkan data.");
                      }
                    }),
                  ),
                  const Text(
                    "Income-Outcome-Conclusion-Target Statistic",
                  ),
                  Expanded(
                    child: charts.BarChart(timeline, animate: true),
                  ),
                  // Center(
                  //   child: YellowButton(
                  //     onPressed: () {
                  //       showDialog(
                  //           context: context,
                  //           builder: (BuildContext context) {
                  //             return AlertDialog(
                  //               scrollable: true,
                  //               title: const Text('Tetapkan target mingguan-mu'),
                  //               content: Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 child: Form(
                  //                   child: Column(
                  //                     children: <Widget>[
                  //                       TextFormField(
                  //                         decoration: const InputDecoration(
                  //                           labelText: 'Target',
                  //                           icon: Icon(Icons.attach_money),
                  //                         ),
                  //                       ),
                  //                       TextFormField(
                  //                         decoration: const InputDecoration(
                  //                           labelText: 'Week',
                  //                           icon: Icon(Icons.message),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //               actions: [
                  //                 YellowButton(
                  //                     label: "Submit",
                  //                     onPressed: () {
                  //                       Navigator.pop(context);
                  //                     }),
                  //               ],
                  //             );
                  //           });
                  //     },
                  //     label: "Tetapkan target mingguan-mu",
                  //   ),
                  // ),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   primary: false,
                  //   // itemCount: dummyTarget.length,
                  //   itemBuilder: ((context, index) {
                  //     return Padding(
                  //       padding: const EdgeInsets.symmetric(vertical: 5.0),
                  //       // child: StatisticTarget(
                  //       //   title: dummyTarget[index]["title"],
                  //       //   message: dummyTarget[index]["message"],
                  //       // ),
                  //     );
                  //   }),
                  // ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
