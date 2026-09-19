import 'package:clean/constants.dart';
import 'package:clean/features/home/domain/entites/book_entity.dart';
import 'package:clean/features/home/presentation/views/widgets/detailes_view_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class DetailesView extends StatelessWidget {
  const DetailesView({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        actions: [
          SizedBox(width: 20),
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: FaIcon(FontAwesomeIcons.x),
          ),
          Spacer(),
          FaIcon(FontAwesomeIcons.bagShopping),
          SizedBox(width: 20),
        ],
      ),
      body: SafeArea(child: DetailesViewBody(book: book)),
    );
  }
}
