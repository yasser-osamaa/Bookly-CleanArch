import 'package:clean/constants.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchFeaturedBooks({int pageNum = 0});
  List<BookEntity> fetchNewestBooks();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<BookEntity> fetchFeaturedBooks({int pageNum = 0}) {
    Box<BookEntity> box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    int start = pageNum;
    int end = (pageNum + 1) * 10;
    if (start >= length || end > length) {
      return [];
    }
    return box.values.toList().sublist(start, end);
  }

  @override
  List<BookEntity> fetchNewestBooks() {
    Box<BookEntity> box = Hive.box<BookEntity>(kNewestBox);
    return box.values.toList();
  }
}
