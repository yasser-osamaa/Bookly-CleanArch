import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:clean/features/search/presentation/manager/cubit/fetch_search_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatefulWidget {
  const SearchResultListView({
    super.key,
    required this.search,
    required this.books,
  });

  final String search;
  final List<BookEntity> books;

  @override
  State<SearchResultListView> createState() => _SearchResultListViewState();
}

class _SearchResultListViewState extends State<SearchResultListView> {
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

    await context.read<FetchSearchResultCubit>().fetchSearchResult(
      search: widget.search,
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
      itemCount: widget.books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 20),
          child: BestSellerItem(book: widget.books[index]),
        );
      },
    );
  }
}
