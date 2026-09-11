import 'package:clean/core/utils/assets_names.dart';
import 'package:flutter/material.dart';

class BigBookItem extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
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
    );
  }
}
