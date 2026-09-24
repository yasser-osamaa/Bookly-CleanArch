import 'package:clean/core/errors/failures.dart';
import 'package:clean/core/use_case/use_case.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/search/domain/entities/search_param.dart';
import 'package:clean/features/search/domain/repo/search_repo.dart';
import 'package:dartz/dartz.dart';

class FetchSearchResultUseCase
    implements UseCase<List<BookEntity>, SearchParams> {
  final SearchRepo searchRepo;

  new({required this.searchRepo});

  @override
  Future<Either<Failures, List<BookEntity>>> call([
    SearchParams? searchParam,
  ]) async {
    if (searchParam == null || searchParam.search.trim().isEmpty) {
      return left(ServerFailure('Search query cannot be empty'));
    }

    return await searchRepo.fetchSearchResult(
      search: searchParam.search.trim(),
      pageNum: searchParam.pageNum,
    );
  }
}
