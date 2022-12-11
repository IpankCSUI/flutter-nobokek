import "package:flutter/material.dart";
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';
import 'package:flutter_nobokek/widgets/last_transaction_card.dart';
import 'package:flutter_nobokek/widgets/report_overview_card.dart';
import 'package:flutter_nobokek/widgets/total_balance_card.dart';
import 'package:flutter_nobokek/widgets/yellow_button.dart';

class MyReportPage extends StatelessWidget {
  const MyReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dummyData = [
      {
        "title": "Dapet dari mamah",
        "tanggal": "12-12-12",
        "jumlah": "(+) Rp. 20.000",
      },
      {
        "title": "Dapet dari mamah",
        "tanggal": "12-12-12",
        "jumlah": "(+) Rp. 20.000",
      },
      {
        "title": "Dapet dari mamah",
        "tanggal": "12-12-12",
        "jumlah": "(+) Rp. 20.000",
      }
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, Ocit!",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              "This is Your Report!",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 48),
            Text(
              "Total Balance",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: ColorPalettes.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            const TotalBalanceCard(label: "Rp. 20.500.000"),
            const SizedBox(height: 48),
            Text(
              "Overview",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: ColorPalettes.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Row(
              children: const [
                ReportOverviewCard(
                  label: "Income",
                  amount: "Rp. 20.500.000",
                ),
                Spacer(),
                ReportOverviewCard(
                  label: "Outcome",
                  amount: "Rp. 20.500.000",
                ),
              ],
            ),
            const SizedBox(height: 48),
            Text(
              "Last Transaction",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: ColorPalettes.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: dummyData.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: LastTransactionCard(
                    title: dummyData[index]["title"],
                    subTitle: dummyData[index]["tanggal"],
                    subTitle2: dummyData[index]["jumlah"],
                  ),
                );
              }),
            ),
            Center(
              child: YellowButton(
                onPressed: () {},
                label: "Apa Target Kamu Hari Ini?",
              ),
            ),
          ],
        ),
      ),
    );
  }
}