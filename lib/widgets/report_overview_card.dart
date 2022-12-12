import "package:flutter/material.dart";
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';

class ReportOverviewCard extends StatelessWidget {
  final String label;
  final String amount;
  const ReportOverviewCard({
    super.key,
    required this.label,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, bottom: 18),
      decoration: const BoxDecoration(
        color: ColorPalettes.freshLemon,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      height: 150,
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: ColorPalettes.grey, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 8),
          Text(
            amount,
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
