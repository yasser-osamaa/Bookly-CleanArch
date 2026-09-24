import 'package:clean/core/utils/functions/service_locator.dart';
import 'package:clean/features/search/domain/use_cases/fetch_search_result_use_case.dart';
import 'package:clean/features/search/presentation/manager/cubit/fetch_search_result_cubit.dart';
import 'package:clean/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchSearchResultCubit(
        fetchSearchResultUseCase: locator.get<FetchSearchResultUseCase>(),
      ),
      child: Scaffold(body: SafeArea(child: SearchViewBody())),
    );
  }
}
