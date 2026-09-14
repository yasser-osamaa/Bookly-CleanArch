import 'package:clean/core/utils/styless.dart';
import 'package:clean/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:clean/features/home/presentation/views/widgets/big_book_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigBookListView(),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 30, bottom: 30),
          child: Text('Best Seller', style: Styless.textStyle24),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: BestSellerItem(),
        ),
      ],
    );
  }
}
