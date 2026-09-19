import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BestSellerBookImg extends StatelessWidget {
  const BestSellerBookImg({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: AspectRatio(
        aspectRatio: 2.5 / 3.8,
        // child: Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(8),
        //     image: DecorationImage(
        //       image: AssetImage(AssetsNames.testImage),
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        // ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(imageUrl: img, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
