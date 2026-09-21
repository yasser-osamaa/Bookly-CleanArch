import 'package:clean/core/errors/failures.dart';
import 'package:clean/features/home/data/data_source/home_local_data_source.dart';
import 'package:clean/features/home/data/data_source/home_remote_data_source.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });

  @override
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks({
    int pageNum = 0,
  }) async {
    List<BookEntity> books;
    try {
      books = homeLocalDataSource.fetchFeaturedBooks(pageNum: pageNum);
      if (books.isNotEmpty) return right(books);

      books = await homeRemoteDataSource.fetchFeaturedBooks(pageNum: pageNum);
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks() async {
    List<BookEntity> books;

    try {
      books = homeLocalDataSource.fetchNewestBooks();

      if (books.isNotEmpty) return right(books);

      books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
