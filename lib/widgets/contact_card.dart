import "package:flutter/material.dart";
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';

class ContactCard extends StatelessWidget {
  final String nama;
  final String kendala;
  final VoidCallback onPressed;
  const ContactCard({
    super.key,
    required this.nama,
    required this.kendala,
    required this.onPressed,
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
                nama,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(kendala),
            ],
          ),
          const Spacer(),
          TextButton(
            onPressed: onPressed,
            child: Text("Terpenuhi",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.red)),
          ),
          // Text(
          //   message,
          //   style: Theme.of(context)
          //       .textTheme
          //       .bodyText1!
          //       .copyWith(fontWeight: FontWeight.bold),
          // ),
          // const SizedBox(width: 16),
        ],
      ),
    );
  }
}
