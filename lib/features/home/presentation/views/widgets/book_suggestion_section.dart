import 'package:clean/core/utils/styless.dart';
import 'package:clean/features/home/presentation/views/widgets/also_like_list_view.dart';
import 'package:flutter/material.dart';

class BookSuggestionSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text('You can Also Like', style: Styless.textStyle18),
        ),
        SizedBox(height: 15),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .2,
          child: AlsoLikeListView(),
        ),
      ],
    );
  }
}
