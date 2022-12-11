import "package:flutter/material.dart";
import 'package:flutter_nobokek/commons/styles/color_palettes.dart';

class YellowButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? minWidth;
  const YellowButton({
    super.key,
    this.onPressed,
    required this.label,
    this.minWidth = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        backgroundColor: ColorPalettes.freshLemon,
        minimumSize: Size(minWidth!, 44),
      ),
      child: Text(
        label,
        style: const TextStyle(color: ColorPalettes.grey),
      ),
    );
  }
}
