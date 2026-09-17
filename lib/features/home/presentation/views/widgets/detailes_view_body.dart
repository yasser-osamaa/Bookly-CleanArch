import 'package:clean/features/home/presentation/views/widgets/book_data_section.dart';
import 'package:clean/features/home/presentation/views/widgets/book_suggestion_section.dart';
import 'package:clean/features/home/presentation/views/widgets/custom_preview_button.dart';
import 'package:clean/features/home/presentation/views/widgets/rate_row.dart';
import 'package:flutter/material.dart';

class DetailesViewBody extends StatelessWidget {
  const DetailesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BookDataSection(),
              SizedBox(height: 10),
              RateRow(),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: CustomPreviewButton(),
              ),
              Expanded(child: SizedBox(height: 40)),
              BookSuggestionSection(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
