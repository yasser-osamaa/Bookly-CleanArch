import 'package:clean/core/utils/styless.dart';
import 'package:flutter/material.dart';

class BookAndAuthorName extends StatelessWidget {
  const BookAndAuthorName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .5,
          child: Text(
            'Harry Potter and The Goblet of Fire',
            style: Styless.textStyle20,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Text(
          'J.K Roling',
          style: Styless.textStyle16.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
