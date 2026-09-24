import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean/core/utils/app_router.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BigBookItem extends StatelessWidget {
  const BigBookItem({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5 / 3.8,
      child: GestureDetector(
        onTap: () {
          //context.read<FetchNewestBooksCubit>().fetchNewestBooks();
          context.push(AppRouter.kDetailesView, extra: book);
        },
        // child: Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(8),
        //     image: DecorationImage(
        //       image: AssetImage(AssetsNames.testImage),
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        // ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(imageUrl: book.bookImg, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
