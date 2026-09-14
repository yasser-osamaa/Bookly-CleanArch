import 'package:clean/core/utils/assets_names.dart';
import 'package:flutter/material.dart';

class BestSellerBookImg extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: AspectRatio(
        aspectRatio: 2.5 / 3.8,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(AssetsNames.testImage),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
