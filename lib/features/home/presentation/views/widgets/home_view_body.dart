import 'package:clean/core/utils/styless.dart';
import 'package:clean/features/home/presentation/views/widgets/best_seller_sliver_list_view_bloc_builder.dart';
import 'package:clean/features/home/presentation/views/widgets/big_books_list_view_bloc_builder.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigBooksListViewBlocBuilder(),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 30, bottom: 30),
                child: Text('Best Seller', style: Styless.textStyle24),
              ),
            ],
          ),
        ),
        BestSellerSliverListViewBlocBuilder(),
      ],
    );
  }
}
