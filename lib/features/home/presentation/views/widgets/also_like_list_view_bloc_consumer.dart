import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/home/presentation/manager/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:clean/features/home/presentation/views/widgets/also_like_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlsoLikeListViewBlocConsumer extends StatefulWidget {
  const AlsoLikeListViewBlocConsumer({super.key});

  @override
  State<AlsoLikeListViewBlocConsumer> createState() =>
      _AlsoLikeListViewBlocConsumerState();
}

class _AlsoLikeListViewBlocConsumerState
    extends State<AlsoLikeListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchNewestBooksCubit, FetchNewestBooksState>(
      builder: (context, state) {
        if (state is FetchNewestBooksSuccess) {
          if (books.isEmpty) {
            books.addAll(state.books);
          }

          return AlsoLikeListView(books: books);
        }

        if (state is FetchNewestBooksPagnationLoading ||
            state is FetchNewestBooksPagnationFailure) {
          return AlsoLikeListView(books: books);
        } else if (state is FetchNewestBooksFailure) {
          return Center(child: Text(state.errorText));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
      listener: (BuildContext context, FetchNewestBooksState state) {
        if (state is FetchNewestBooksSuccess) {
          books.addAll(state.books);
        }
      },
    );
  }
}
