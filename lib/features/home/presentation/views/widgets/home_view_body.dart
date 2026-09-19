import 'package:clean/core/utils/styless.dart';
import 'package:clean/features/home/presentation/manager/fetch_feature_books_cubit/fetch_feature_books_cubit.dart';
import 'package:clean/features/home/presentation/views/widgets/best_seller_sliver_list_view.dart';
import 'package:clean/features/home/presentation/views/widgets/big_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        BestSellerSliverListView(),
      ],
    );
  }
}

class BigBooksListViewBlocBuilder extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFeatureBooksCubit, FetchFeatureBooksState>(
      builder: (context, state) {
        if (state is FetchFeatureBooksSuccess) {
          return BigBookListView();
        } else if (state is FetchFeatureBooksFailure) {
          return Center(child: Text(state.errorText));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
