import 'package:clean/constants.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:hive/hive.dart';

abstract class SearchLocalDataSource {
  List<BookEntity> fetchSearchResult({int pageNum = 0});
}

class SearchLocalDataSourceImpl implements SearchLocalDataSource {
  @override
  List<BookEntity> fetchSearchResult({int pageNum = 0}) {
    Box<BookEntity> box = Hive.box<BookEntity>(kSearchtBox);

    int len = box.values.length;
    int start = pageNum;
    int end = (pageNum + 1) * 10;

    if (start >= len || end > len) {
      return [];
    }
    return box.values.toList().sublist(start, end);
  }
}
