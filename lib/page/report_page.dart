import "package:flutter/material.dart";
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';
import 'package:flutter_nobokek/models/money.dart';
import 'package:flutter_nobokek/function/api.dart';
import 'package:flutter_nobokek/page/main_page.dart';
import 'package:flutter_nobokek/widgets/last_transaction_card.dart';
import 'package:flutter_nobokek/widgets/report_overview_card.dart';
import 'package:flutter_nobokek/widgets/total_balance_card.dart';
import 'package:flutter_nobokek/widgets/yellow_button.dart';
import 'package:flutter_nobokek/widgets/target_card.dart';

class MyReportPage extends StatefulWidget {
  const MyReportPage({super.key});

  @override
  State<MyReportPage> createState() => _MyReportPageState();
}

class _MyReportPageState extends State<MyReportPage> {
  String? target;
  String? desc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: NoBokekApi.fetchUsername(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Text(
                    'Hello, ${snapshot.data}!',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: FontWeight.bold),
                  );
                } else if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasData) {
                  return const Text(
                      "Gagal mendapatkan data username pengguna.");
                } else {
                  return const Text("Sedang mendapatkan data.");
                }
              },
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
            FutureBuilder(
              future: NoBokekApi.fetchTransactions(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  final balance = _getUserBalance(snapshot.data!);
                  return TotalBalanceCard(label: 'Rp. ${balance.toString()}');
                } else if (snapshot.connectionState == ConnectionState.done &&
                    !snapshot.hasData) {
                  return const TotalBalanceCard(
                      label: "Gagal mendapatkan data balance pengguna.");
                } else {
                  return const TotalBalanceCard(
                      label: "Sedang mendapatkan data.");
                }
              },
            ),
            const SizedBox(height: 48),
            Text(
              "Overview",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: ColorPalettes.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                FutureBuilder(
                  future: NoBokekApi.fetchTransactions(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      final income = _getUserIncome(snapshot.data!);
                      return ReportOverviewCard(
                        label: "Income",
                        amount: 'Rp. ${income.toString()}',
                      );
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        !snapshot.hasData) {
                      return const ReportOverviewCard(
                        label: "Income",
                        amount: "Gagal mendapatkan data outcome pengguna.",
                      );
                    } else {
                      return const ReportOverviewCard(
                        label: "Income",
                        amount: "Sedang mendapatkan data...",
                      );
                    }
                  },
                ),
                const Spacer(),
                FutureBuilder(
                  future: NoBokekApi.fetchTransactions(context),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      final outcome = _getUserOutcome(snapshot.data!);
                      return ReportOverviewCard(
                        label: "Outcome",
                        amount: 'Rp. ${outcome.toString()}',
                      );
                    } else if (snapshot.connectionState ==
                            ConnectionState.done &&
                        !snapshot.hasData) {
                      return const ReportOverviewCard(
                        label: "Outcome",
                        amount: "Gagal mendapatkan data outcome pengguna.",
                      );
                    } else {
                      return const ReportOverviewCard(
                        label: "Outcome",
                        amount: "Sedang mendapatkan data...",
                      );
                    }
                  },
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
            FutureBuilder(
              future: NoBokekApi.fetchTransactions(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: LastTransactionCard(
                          isIncome: snapshot.data![index].fields.income != null,
                          title: snapshot.data![index].fields.descIn != null
                              ? snapshot.data![index].fields.descIn!
                              : snapshot.data![index].fields.descOut!,
                          tanggal: snapshot.data![index].fields.date.toString(),
                          jumlah: snapshot.data![index].fields.income != null
                              ? snapshot.data![index].fields.income!
                              : snapshot.data![index].fields.outcome!,
                        ),
                      );
                    }),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorPalettes.freshLemon,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
            Center(
              child: YellowButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: const Text('Apa Target Kamu Hari ini?'),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    onChanged: (value) {
                                      target = value;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Target',
                                      icon: Icon(Icons.attach_money),
                                    ),
                                  ),
                                  TextFormField(
                                    onChanged: (value) {
                                      desc = value;
                                    },
                                    decoration: const InputDecoration(
                                      labelText: 'Description',
                                      icon: Icon(Icons.message),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            YellowButton(
                                label: "Submit",
                                onPressed: () {
                                  if (target != null && desc != null) {
                                    final data = {
                                      "title": target,
                                      "description": desc,
                                    };
                                    NoBokekApi.addTarget(context, data);
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const MainPage(
                                            page: 3,
                                          ),
                                        ),
                                        (route) => false);
                                  }
                                }),
                          ],
                        );
                      });
                },
                label: "Apa Target Kamu Hari Ini?",
              ),
            ),
            FutureBuilder(
              future: NoBokekApi.fetchReport(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: TargetCard(
                          title: snapshot.data![index].title,
                          message: snapshot.data![index].desc,
                          onPressed: () {
                            NoBokekApi.deleteTarget(
                                context, snapshot.data![index].pk);
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainPage(
                                    page: 3,
                                  ),
                                ),
                                (route) => false);
                          },
                        ),
                      );
                    }),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ColorPalettes.freshLemon,
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  int _getUserBalance(List<Money> listTransactions) {
    int balance = 0;
    for (var i = 0; i < listTransactions.length; i++) {
      if (listTransactions[i].fields.income != null) {
        balance = balance + listTransactions[i].fields.income!.toInt();
      } else {
        balance = balance - listTransactions[i].fields.outcome!.toInt();
      }
    }
    return balance;
  }

  int _getUserIncome(List<Money> listTransactions) {
    int income = 0;
    for (var i = 0; i < listTransactions.length; i++) {
      if (listTransactions[i].fields.income != null) {
        income = income + listTransactions[i].fields.income!.toInt();
      }
    }
    return income;
  }

  int _getUserOutcome(List<Money> listTransactions) {
    int outcome = 0;
    for (var i = 0; i < listTransactions.length; i++) {
      if (listTransactions[i].fields.outcome != null) {
        outcome = outcome + listTransactions[i].fields.outcome!.toInt();
      }
    }
    return outcome;
  }
}
