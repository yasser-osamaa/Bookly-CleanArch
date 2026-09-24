import 'package:clean/core/utils/styless.dart';
import 'package:clean/features/home/presentation/manager/fetch_newest_books_cubit/fetch_newest_books_cubit.dart';
import 'package:clean/features/home/presentation/views/widgets/best_seller_sliver_list_view_bloc_builder.dart';
import 'package:clean/features/home/presentation/views/widgets/big_books_list_view_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
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

    if (maxScroll - currentScroll < 500 && !isLoading) {
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
    return CustomScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigBooksListViewBlocBuilder(),

              Padding(
                padding: const EdgeInsets.only(left: 10, top: 30, bottom: 30),
                child: Text('Best Seller', style: Styless.textStyle24),
              ),
            ],
          ),
        ),

        BestSellerSliverListViewBlocConsumer(),
      ],
    );
  }
}
