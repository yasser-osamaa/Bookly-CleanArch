import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/home/domain/use_cases/fetch_feature_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_feature_books_state.dart';

class FetchFeatureBooksCubit extends Cubit<FetchFeatureBooksState> {
  FetchFeatureBooksCubit({required this.fetchFeatureBooksUseCase})
    : super(FetchFeatureBooksInitial());

  final FetchFeatureBooksUseCase fetchFeatureBooksUseCase;

  Future<void> fetchFeatureBooks() async {
    emit(FetchFeatureBooksLoading());
    var books = await fetchFeatureBooksUseCase.call();
    books.fold(
      (failure) {
        emit(FetchFeatureBooksFailure(errorText: failure.errorText));
      },
      (listBooks) {
        emit(FetchFeatureBooksSuccess(books: listBooks));
      },
    );
  }
}
