import 'package:clean/features/home/presentation/views/widgets/detailes_view_body.dart';
import 'package:flutter/material.dart';

class DetailesView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: DetailesViewBody()));
  }
}
