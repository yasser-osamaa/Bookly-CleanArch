import 'package:clean/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';

class BestSellerSliverListView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: 6, (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: BestSellerItem(),
        );
      }),
    );
  }
}
