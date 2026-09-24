import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/home/presentation/manager/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:clean/features/home/presentation/views/widgets/big_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlsoLikeListView extends StatefulWidget {
  const AlsoLikeListView({super.key, required this.books});

  final List<BookEntity> books;

  @override
  State<AlsoLikeListView> createState() => _AlsoLikeListViewState();
}

class _AlsoLikeListViewState extends State<AlsoLikeListView> {
  late ScrollController scrollController;

  int pageNum = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    final currentScroll = scrollController.position.pixels;
    final maxScroll = scrollController.position.maxScrollExtent;

    final scrollPercentage = currentScroll / maxScroll;

    if (scrollPercentage >= 0.7 && !isLoading) {
      _fetchNextPage();
    }
  }

  Future<void> _fetchNextPage() async {
    isLoading = true;

    await context.read<FetchNewestBooksCubit>().fetchNewestBooks(
      pageNum: pageNum,
    );

    pageNum++;
    isLoading = false;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20),
          child: BigBookItem(book: widget.books[index]),
        );
      },
    );
  }
}
