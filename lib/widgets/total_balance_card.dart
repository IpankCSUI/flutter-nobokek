import "package:flutter/material.dart";
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';

class TotalBalanceCard extends StatelessWidget {
  final String label;
  const TotalBalanceCard({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: ColorPalettes.freshLemon,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      width: double.infinity,
      height: 150,
      child: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
