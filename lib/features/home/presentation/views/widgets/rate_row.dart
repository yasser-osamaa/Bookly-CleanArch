import 'package:clean/core/utils/styless.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RateRow extends StatelessWidget {
  const RateRow({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        FaIcon(FontAwesomeIcons.solidStar, color: Colors.amberAccent, size: 21),
        SizedBox(width: 5),
        Text("${book.rate}", style: Styless.textStyle18),
        SizedBox(width: 5),
        Text(
          '(${book.peopleRate})',
          style: Styless.textStyle16.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
