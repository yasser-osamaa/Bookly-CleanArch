import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/home/presentation/manager/fetch_feature_books_cubit/fetch_feature_books_cubit.dart';
import 'package:clean/features/home/presentation/views/widgets/big_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BigBookListView extends StatefulWidget {
  const BigBookListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<BigBookListView> createState() => _BigBookListViewState();
}

class _BigBookListViewState extends State<BigBookListView> {
  late ScrollController scrollController;

  int pageNum = 1;
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    final maxScroll = scrollController.position.maxScrollExtent;
    final currentScroll = scrollController.position.pixels;

    if (currentScroll >= maxScroll * 0.7) {
      if (!isLoadingMore) {
        isLoadingMore = true;

        await context.read<FetchFeatureBooksCubit>().fetchFeatureBooks(
          pageNum: pageNum++,
        );

        isLoadingMore = false;
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .33,
      child: ListView.builder(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: BigBookItem(book: widget.books[index]),
          );
        },
      ),
    );
  }
}
