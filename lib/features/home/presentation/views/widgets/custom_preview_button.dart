import 'package:clean/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomPreviewButton extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          borderRadius: BorderRadiusGeometry.only(
            bottomLeft: Radius.circular(12),
            topLeft: Radius.circular(12),
          ),
          backgroundColor: Color(0xffef8262),
          textColor: Colors.white,
          text: '19.99EGP',
        ),
        CustomButton(
          borderRadius: BorderRadiusGeometry.only(
            bottomRight: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          backgroundColor: Colors.white,
          textColor: Colors.black,
          text: 'Free Preview',
        ),
      ],
    );
  }
}
