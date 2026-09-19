import 'package:clean/core/utils/api_service.dart';
import 'package:clean/features/home/data/data_source/home_local_data_source.dart';
import 'package:clean/features/home/data/data_source/home_remote_data_source.dart';
import 'package:clean/features/home/data/repos/home_repo_impl.dart';
import 'package:clean/features/home/domain/use_cases/fetch_feature_books_use_case.dart';
import 'package:clean/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerSingleton<ApiService>(ApiService(Dio()));

  locator.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: locator.get<ApiService>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImpl(),
    ),
  );

  locator.registerSingleton<FetchFeatureBooksUseCase>(
    FetchFeatureBooksUseCase(homeRepo: locator.get<HomeRepoImpl>()),
  );

  locator.registerSingleton<FetchNewestBooksUseCase>(
    FetchNewestBooksUseCase(homeRepo: locator.get<HomeRepoImpl>()),
  );
}
