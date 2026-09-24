import 'package:clean/constants.dart';
import 'package:clean/core/utils/snackbars/error_snack_bar.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/search/presentation/manager/cubit/fetch_search_result_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive/hive.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        onSubmitted: (value) async {
          if (value.trim().isEmpty) {
            showErrorSnackBar(context, 'Please enter a book name');
            return;
          }
          final cubit = context.read<FetchSearchResultCubit>();

          Box<BookEntity> box = Hive.box<BookEntity>(kSearchtBox);

          await box.clear();

          cubit.fetchSearchResult(search: value.trim());
        },
        decoration: InputDecoration(
          suffixIcon: const Padding(
            padding: EdgeInsets.all(12),
            child: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 20),
          ),
          hintText: 'Ex: The Power of Habits',
          labelText: "Book's name",
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
