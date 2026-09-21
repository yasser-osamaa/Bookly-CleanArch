import 'package:clean/core/errors/failures.dart';
import 'package:clean/core/use_case/use_case.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeatureBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeatureBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failures, List<BookEntity>>> call([int param = 0]) {
    return homeRepo.fetchFeaturedBooks(pageNum: param);
  }
}
