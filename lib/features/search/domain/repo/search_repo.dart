import 'package:clean/core/errors/failures.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failures, List<BookEntity>>> fetchSearchResult({
    required String search,
    int pageNum = 0,
  });
}
