import 'package:clean/constants.dart';
import 'package:clean/core/utils/api_service.dart';
import 'package:clean/core/utils/functions/add_books_to_box.dart';
import 'package:clean/features/home/data/models/book_model/book_model.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNum = 0});
  Future<List<BookEntity>> fetchNewestBooks({int pageNum = 0});
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiService apiService;
  final _apiKey = 'AIzaSyBO1uswpYNMZX2ynT07zna8b3MjuVfZLZM';

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNum = 0}) async {
    var data = await apiService.get(
      endpoint:
          'volumes?q=science&filter=free-ebooks&key=$_apiKey&startIndex=${pageNum * 10}',
    );

    List<BookEntity> books = extractBooksFromJson(data);

    addBooksToBox(books, kFeaturedBox);

    return books;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNum = 0}) async {
    var data = await apiService.get(
      endpoint:
          'volumes?q=programming&filter=free-ebooks&orderBy=newest&key=$_apiKey&startIndex=${pageNum * 10}',
    );

    List<BookEntity> books = extractBooksFromJson(data);

    addBooksToBox(books, kNewestBox);
    return books;
  }

  List<BookEntity> extractBooksFromJson(Map<String, dynamic> data) {
    List<BookEntity> books = [];

    for (var bookItem in data['items']) {
      books.add(BookModel.fromJson(bookItem));
    }
    return books;
  }
}
