import 'package:flutter/material.dart';
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';
import 'package:flutter_nobokek/widgets/report_overview_card.dart';

class MyReportPage extends StatelessWidget {
  const MyReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> _dummyData = [
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
      },
    ];
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
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
                Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: ColorPalettes.freshLemon,
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  width: double.infinity,
                  height: 150,
                  child: Text(
                    "Rp. 20.500.000",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
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
                  "Late Transaction",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      color: ColorPalettes.grey, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          // SliverFillRemaining(
          //   child: ListView.builder(
          //     physics: NeverScrollableScrollPhysics(),
          //     itemCount: _dummyData.length,
          //     itemBuilder: (context, index) {
          //       return Container(
          //         height: 50,
          //         color: Colors.red,
          //         child: Text(_dummyData[index]["title"]!),
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
