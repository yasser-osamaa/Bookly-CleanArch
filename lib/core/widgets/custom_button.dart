import 'package:clean/core/utils/styless.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    this.borderRadius = BorderRadius.zero,
    required this.textColor,
    required this.text,
    this.onPressed,
  });
  final BorderRadiusGeometry borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 60,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: Styless.textStyle18.copyWith(color: textColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
