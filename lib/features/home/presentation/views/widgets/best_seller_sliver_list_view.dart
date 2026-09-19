import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class BestSellerSliverListView extends StatelessWidget {
  const BestSellerSliverListView({super.key, required this.books});
  final List<BookEntity> books;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: books.length, (
        context,
        index,
      ) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: BestSellerItem(book: books[index]),
        );
      }),
    );
  }
}
