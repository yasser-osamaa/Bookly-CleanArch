part of 'fetch_feature_books_cubit.dart';

sealed class FetchFeatureBooksState {}

final class FetchFeatureBooksInitial extends FetchFeatureBooksState {}

final class FetchFeatureBooksLoading extends FetchFeatureBooksState {}

final class FetchFeatureBooksPagnagingLoading extends FetchFeatureBooksState {}

final class FetchFeatureBooksPagnagingFailure extends FetchFeatureBooksState {
  final String errorText;

  new({required this.errorText});
}

final class FetchFeatureBooksFailure extends FetchFeatureBooksState {
  final String errorText;

  new({required this.errorText});
}

final class FetchFeatureBooksSuccess extends FetchFeatureBooksState {
  final List<BookEntity> books;

  new({required this.books});
}
