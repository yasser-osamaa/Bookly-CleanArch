import 'package:clean/core/utils/styless.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PriceAndRateRow extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('19.99 EGP', style: Styless.textStyle18),
        SizedBox(width: 30),
        FaIcon(FontAwesomeIcons.solidStar, color: Colors.amberAccent, size: 21),
        SizedBox(width: 5),
        Text('4.8', style: Styless.textStyle18),
        SizedBox(width: 5),
        Text('(2801)', style: Styless.textStyle16.copyWith(color: Colors.grey)),
      ],
    );
  }
}
