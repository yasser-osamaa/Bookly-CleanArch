import 'package:clean/features/home/presentation/manager/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:clean/features/home/presentation/views/widgets/also_like_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlsoLikeListViewBlocBuilder extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchNewestBooksCubit, FetchNewestBooksState>(
      builder: (context, state) {
        if (state is FetchNewestBooksSuccess) {
          return AlsoLikeListView(books: state.books);
        } else if (state is FetchNewestBooksFailure) {
          return Center(child: Text(state.errorText));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
