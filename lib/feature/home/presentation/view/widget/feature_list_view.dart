import 'package:book_app/feature/home/presentation/view/widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class FeatureListView extends StatelessWidget {
  const FeatureListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: const CustomBookImage(),
            );
          }),
    );
  }
}
