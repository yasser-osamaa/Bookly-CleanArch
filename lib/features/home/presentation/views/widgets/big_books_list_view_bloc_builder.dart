import 'package:clean/features/home/presentation/manager/fetch_feature_books_cubit/fetch_feature_books_cubit.dart';
import 'package:clean/features/home/presentation/views/widgets/big_book_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BigBooksListViewBlocBuilder extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFeatureBooksCubit, FetchFeatureBooksState>(
      builder: (context, state) {
        if (state is FetchFeatureBooksSuccess) {
          return BigBookListView(books: state.books);
        } else if (state is FetchFeatureBooksFailure) {
          return Center(child: Text(state.errorText));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
