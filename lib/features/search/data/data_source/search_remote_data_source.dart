import 'package:clean/constants.dart';
import 'package:clean/core/utils/api_service.dart';
import 'package:clean/core/utils/functions/add_books_to_box.dart';
import 'package:clean/features/home/data/models/book_model/book_model.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchSearchResult({
    required String searchText,
    int pageNum = 0,
  });
}

class SearchReamoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiService _apiService;
  final apiKey = dotenv.env['GOOGLE_BOOKS_API_KEY'];

  SearchReamoteDataSourceImpl({required this._apiService});
  @override
  Future<List<BookEntity>> fetchSearchResult({
    required String searchText,
    int pageNum = 0,
  }) async {
    var map = await _apiService.get(
      endpoint:
          'volumes?q=$searchText&filter=free-ebooks&key=$apiKey&startIndex=${pageNum * 10}',
    );
    List<BookEntity> books = searchResultBooks(map);
    addBooksToBox(books, kSearchtBox);
    return books;
  }

  List<BookEntity> searchResultBooks(Map<String, dynamic> map) {
    List<BookEntity> books = [];
    for (var book in map['items']) {
      books.add(BookModel.fromJson(book));
    }
    return books;
  }
}
