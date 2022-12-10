import "package:flutter/material.dart";
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';

class YellowButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  const YellowButton({
    super.key,
    this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)))),
          backgroundColor: MaterialStateProperty.all(ColorPalettes.freshLemon)),
      child: Text(
        label,
        style: const TextStyle(color: ColorPalettes.grey),
      ),
    );
  }
}
