import "package:flutter/material.dart";
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';

class LastTransactionCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String subTitle2;
  const LastTransactionCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.subTitle2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
          color: ColorPalettes.grey2,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: [
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(subTitle),
            ],
          ),
          const Spacer(),
          Text(
            subTitle2,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }
}
