import 'package:clean/core/utils/styless.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/home/presentation/views/widgets/big_book_item.dart';
import 'package:flutter/material.dart';

class BookDataSection extends StatelessWidget {
  const BookDataSection({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .29),
          child: BigBookItem(book: book),
        ),
        SizedBox(height: 30),
        SizedBox(
          width: width * .7,
          child: Text(
            book.title,
            style: Styless.textStyle24,
            textAlign: TextAlign.center,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          width: width * .7,
          child: Opacity(
            opacity: .7,
            child: Text(
              book.authorName,
              style: Styless.textStyle16,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
