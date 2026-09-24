import 'package:clean/core/utils/snackbars/error_snack_bar.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/home/presentation/manager/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:clean/features/home/presentation/views/widgets/best_seller_sliver_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerSliverListViewBlocConsumer extends StatefulWidget {
  const BestSellerSliverListViewBlocConsumer({super.key});

  @override
  State<BestSellerSliverListViewBlocConsumer> createState() =>
      _BestSellerSliverListViewBlocConsumerState();
}

class _BestSellerSliverListViewBlocConsumerState
    extends State<BestSellerSliverListViewBlocConsumer> {
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchNewestBooksCubit, FetchNewestBooksState>(
      builder: (context, state) {
        if (state is FetchNewestBooksSuccess ||
            state is FetchNewestBooksPagnationLoading ||
            state is FetchNewestBooksPagnationFailure) {
          return BestSellerSliverListView(books: books);
        } else if (state is FetchNewestBooksFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.errorText)),
          );
        } else {
          return SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
      listener: (BuildContext context, FetchNewestBooksState state) {
        if (state is FetchNewestBooksSuccess) {
          books.addAll(state.books);
        } else if (state is FetchNewestBooksPagnationFailure) {
          showErrorSnackBar(context, 'Pagination Error');
        }
      },
    );
  }
}
