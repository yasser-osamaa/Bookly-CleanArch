import 'package:clean/constants.dart';
import 'package:clean/features/splash/presentation/views/splash_viwe.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kPrimaryColor,
        brightness: Brightness.dark,
        fontFamily: 'GT Sectra Fine Regular',
      ),
      home: const SplashViwe(),
    );
  }
}
