import 'package:clean/constants.dart';
import 'package:clean/core/utils/app_router.dart';
import 'package:clean/core/utils/assets_names.dart';
import 'package:clean/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(width: 20),
          Image.asset(AssetsNames.logoImage, height: 30),
          Spacer(),
          IconButton(
            onPressed: () {
              context.push(AppRouter.kDsearchView);
            },
            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
