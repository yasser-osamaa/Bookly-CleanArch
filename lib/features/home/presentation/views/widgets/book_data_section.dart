import 'package:clean/core/utils/styless.dart';
import 'package:clean/features/home/presentation/views/widgets/big_book_item.dart';
import 'package:flutter/material.dart';

class BookDataSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .29),
          child: BigBookItem(),
        ),
        SizedBox(height: 30),
        SizedBox(
          width: width * .7,
          child: Text(
            'Harry Potter and The Goblet of Fire',
            style: Styless.textStyle24,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          width: width * .7,
          child: Opacity(
            opacity: .7,
            child: Text(
              'J.K Roling',
              style: Styless.textStyle16,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
