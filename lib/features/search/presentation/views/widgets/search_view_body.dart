import 'package:clean/core/utils/styless.dart';
import 'package:clean/features/search/presentation/views/widgets/search_result_list_view_bloc_consumer.dart';
import 'package:clean/features/search/presentation/views/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 50),
        SearchTextField(),
        SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.only(left: 30, bottom: 20),
          child: Text('Search Result', style: Styless.textStyle24),
        ),
        Expanded(child: SearchResultListViewBlocConsumer()),
      ],
    );
  }
}
