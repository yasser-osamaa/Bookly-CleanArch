import 'package:clean/core/utils/snackbars/error_snack_bar.dart';
import 'package:clean/core/utils/styless.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/search/presentation/manager/cubit/fetch_search_result_cubit.dart';
import 'package:clean/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListViewBlocConsumer extends StatefulWidget {
  const SearchResultListViewBlocConsumer({super.key});

  @override
  State<SearchResultListViewBlocConsumer> createState() =>
      _SearchResultListViewBlocConsumerState();
}

class _SearchResultListViewBlocConsumerState
    extends State<SearchResultListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchSearchResultCubit, FetchSearchResultState>(
      listener: (context, state) {
        if (state is FetchSearchResultLoading) {
          books.clear();
        }
        if (state is FetchSearchResultSuccess) {
          books.addAll(state.books);
        } else if (state is FetchSearchResultPagnationFailure) {
          showErrorSnackBar(context, 'Pagination Error Wait');
        }
      },
      builder: (context, state) {
        if (state is FetchSearchResultSuccess ||
            state is FetchSearchResultPagnationLoading ||
            state is FetchSearchResultPagnationFailure) {
          return Expanded(
            child: SearchResultListView(
              search: context.read<FetchSearchResultCubit>().searchT,
              books: books,
            ),
          );
        } else if (state is FetchSearchResultInitial) {
          return Expanded(
            child: Center(
              child: Text(
                'Please Search First For the Results',
                style: Styless.textStyle30,
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else if (state is FetchSearchResultFailure) {
          return Expanded(child: Center(child: Text(state.errorText)));
        } else {
          return Expanded(child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
