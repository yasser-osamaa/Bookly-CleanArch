part of 'fetch_search_result_cubit.dart';

sealed class FetchSearchResultState {}

final class FetchSearchResultInitial extends FetchSearchResultState {}

final class FetchSearchResultLoading extends FetchSearchResultState {}

final class FetchSearchResultSuccess extends FetchSearchResultState {
  final List<BookEntity> books;

  new({required this.books});
}

final class FetchSearchResultFailure extends FetchSearchResultState {
  final String errorText;

  new({required this.errorText});
}

final class FetchSearchResultPagnationFailure extends FetchSearchResultState {
  final String errorText;

  new({required this.errorText});
}

final class FetchSearchResultPagnationLoading extends FetchSearchResultState {}
