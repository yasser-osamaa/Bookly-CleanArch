import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

void addBooksToBox(List<BookEntity> books, String boxName) {
  Box box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}
