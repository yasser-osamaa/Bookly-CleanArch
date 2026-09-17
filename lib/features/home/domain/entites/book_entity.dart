import 'package:hive_flutter/hive_flutter.dart';
part 'book_entity.g.dart';

@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookImg;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String authorName;
  @HiveField(3)
  final num price;
  @HiveField(4)
  final num rate;
  @HiveField(5)
  final num peopleRate;

  BookEntity({
    required this.bookImg,
    required this.title,
    required this.authorName,
    required this.price,
    required this.rate,
    required this.peopleRate,
  });
}
