import 'package:clean/core/utils/app_router.dart';
import 'package:clean/core/utils/styless.dart';
import 'package:clean/features/home/presentation/views/widgets/best_seller_book_img.dart';
import 'package:clean/features/home/presentation/views/widgets/book_and_author_name.dart';
import 'package:clean/features/home/presentation/views/widgets/reate_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouter.kDetailesView);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BestSellerBook(),
          SizedBox(width: 30),
          Expanded(
            child: SizedBox(
              height: 150,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookAndAuthorName(),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('19.99 EGP', style: Styless.textStyle18),
                      Spacer(),
                      RateRow(),
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
