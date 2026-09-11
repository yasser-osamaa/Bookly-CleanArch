import 'package:clean/features/home/presentation/views/widgets/big_book_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [BigBookListView()]);
  }
}
