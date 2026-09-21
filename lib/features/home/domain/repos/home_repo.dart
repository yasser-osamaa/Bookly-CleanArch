import 'package:clean/core/errors/failures.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookEntity>>> fetchFeaturedBooks({
    int pageNum = 0,
  });

  Future<Either<Failures, List<BookEntity>>> fetchNewestBooks();
}
