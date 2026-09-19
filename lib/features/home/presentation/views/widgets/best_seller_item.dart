import 'package:clean/core/utils/app_router.dart';
import 'package:clean/core/utils/styless.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/home/presentation/views/widgets/best_seller_book_img.dart';
import 'package:clean/features/home/presentation/views/widgets/book_and_author_name.dart';
import 'package:clean/features/home/presentation/views/widgets/rate_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.kDetailesView, extra: book);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BestSellerBookImg(img: book.bookImg),
          SizedBox(width: 30),
          Expanded(
            child: SizedBox(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookAndAuthorName(book: book),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${book.price} EGP", style: Styless.textStyle18),
                      Spacer(),
                      RateRow(book: book),
                      Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
