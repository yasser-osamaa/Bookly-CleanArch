part of 'fetch_newest_books_cubit.dart';

sealed class FetchNewestBooksState {}

final class FetchNewestBooksInitial extends FetchNewestBooksState {}

final class FetchNewestBooksFailure extends FetchNewestBooksState {
  final String errorText;

  new({required this.errorText});
}

final class FetchNewestBooksLoading extends FetchNewestBooksState {}

final class FetchNewestBooksSuccess extends FetchNewestBooksState {
  final List<BookEntity> books;

  new({required this.books});
}
