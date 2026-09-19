import 'package:clean/core/utils/styless.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:flutter/material.dart';

class BookAndAuthorName extends StatelessWidget {
  const BookAndAuthorName({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * .5,
          child: Text(
            book.title,
            style: Styless.textStyle20,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        Text(
          book.authorName,
          style: Styless.textStyle16.copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
