import 'package:clean/features/home/presentation/views/widgets/big_book_item.dart';
import 'package:flutter/material.dart';

class BigBookListView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .33,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: BigBookItem(),
          );
        },
      ),
    );
  }
}
