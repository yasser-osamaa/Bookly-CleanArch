import 'package:clean/core/utils/assets_names.dart';
import 'package:flutter/material.dart';

class ImageWithFadeTransation extends StatelessWidget {
  const ImageWithFadeTransation({super.key, required this.fadeAnimation});

  final Animation<double> fadeAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: fadeAnimation,
      builder: (context, child) {
        return FadeTransition(
          opacity: fadeAnimation,
          child: Image.asset(AssetsNames.logoImage),
        );
      },
    );
  }
}
