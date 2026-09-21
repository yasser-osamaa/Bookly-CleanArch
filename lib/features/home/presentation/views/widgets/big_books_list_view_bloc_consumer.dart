import 'package:clean/core/utils/snackbars/error_snack_bar.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/home/presentation/manager/fetch_feature_books_cubit/fetch_feature_books_cubit.dart';
import 'package:clean/features/home/presentation/views/widgets/big_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BigBooksListViewBlocBuilder extends StatefulWidget {
  const new({super.key});

  @override
  State<BigBooksListViewBlocBuilder> createState() =>
      _BigBooksListViewBlocBuilderState();
}

class _BigBooksListViewBlocBuilderState
    extends State<BigBooksListViewBlocBuilder> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchFeatureBooksCubit, FetchFeatureBooksState>(
      listener: (context, state) {
        if (state is FetchFeatureBooksSuccess) {
          books.addAll(state.books);
        } else if (state is FetchFeatureBooksPagnagingFailure) {
          showErrorSnackBar(context, 'No More Books, Try latter');
        }
      },
      builder: (context, state) {
        if (state is FetchFeatureBooksSuccess ||
            state is FetchFeatureBooksPagnagingLoading ||
            state is FetchFeatureBooksPagnagingFailure) {
          return BigBookListView(books: books);
        } else if (state is FetchFeatureBooksFailure) {
          return Center(child: Text(state.errorText));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
