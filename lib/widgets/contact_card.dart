import "package:flutter/material.dart";
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';

class ContactCard extends StatelessWidget {
  final String alamat;
  final String masalah;
<<<<<<< HEAD
  
=======
  final VoidCallback onPressed;
>>>>>>> 58fff21aa06355b7bf0b8067b9d45dc93442ae2b
  const ContactCard({
    super.key,
    required this.alamat,
    required this.masalah,
<<<<<<< HEAD
=======
    required this.onPressed,
>>>>>>> 58fff21aa06355b7bf0b8067b9d45dc93442ae2b
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
                alamat,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(masalah),
            ],
          ),
          const Spacer(),

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
