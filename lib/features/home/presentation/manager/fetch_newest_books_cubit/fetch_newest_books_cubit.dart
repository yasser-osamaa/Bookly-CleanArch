import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_newest_books_state.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState> {
  FetchNewestBooksCubit({required this.fetchNewestBooksUseCase})
    : super(FetchNewestBooksInitial());

  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(FetchNewestBooksLoading());
    var books = await fetchNewestBooksUseCase.call();

    books.fold(
      (failure) {
        emit(FetchNewestBooksFailure(errorText: failure.errorText));
      },
      (listBooks) {
        emit(FetchNewestBooksSuccess(books: listBooks));
      },
    );
  }
}
