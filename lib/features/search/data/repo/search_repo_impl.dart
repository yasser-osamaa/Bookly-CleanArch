import 'package:clean/core/errors/failures.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/search/data/data_source/search_local_data_source.dart';
import 'package:clean/features/search/data/data_source/search_remote_data_source.dart';
import 'package:clean/features/search/domain/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchLocalDataSource searchLocalDataSource;
  final SearchRemoteDataSource searchRemoteDataSource;

  SearchRepoImpl({
    required this.searchLocalDataSource,
    required this.searchRemoteDataSource,
  });

  @override
  Future<Either<Failures, List<BookEntity>>> fetchSearchResult({
    required String search,
    int pageNum = 0,
  }) async {
    late List<BookEntity> books;
    try {
      books = searchLocalDataSource.fetchSearchResult(pageNum: pageNum);
      if (books.isNotEmpty) return right(books);
      books = await searchRemoteDataSource.fetchSearchResult(
        searchText: search,
        pageNum: pageNum,
      );

      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
