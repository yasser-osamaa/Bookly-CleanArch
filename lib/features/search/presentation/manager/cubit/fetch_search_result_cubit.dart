import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/search/domain/entities/search_param.dart';
import 'package:clean/features/search/domain/use_cases/fetch_search_result_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_search_result_state.dart';

class FetchSearchResultCubit extends Cubit<FetchSearchResultState> {
  FetchSearchResultCubit({required this.fetchSearchResultUseCase})
    : super(FetchSearchResultInitial());

  final FetchSearchResultUseCase fetchSearchResultUseCase;

  Future<void> fetchSearchResult({
    required String search,
    int pageNum = 0,
  }) async {
    var result = await fetchSearchResultUseCase.call(
      SearchParams(search: search, pageNum: pageNum),
    );

    if (pageNum == 0) {
      emit(FetchSearchResultLoading());
    } else {
      emit(FetchSearchResultPagnationLoading());
    }
    result.fold(
      (fail) {
        if (pageNum == 0) {
          emit(FetchSearchResultFailure(errorText: fail.errorText));
        } else {
          emit(FetchSearchResultPagnationFailure(errorText: fail.errorText));
        }
      },
      (books) {
        emit(FetchSearchResultSuccess(books: books));
      },
    );
  }
}
