import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/images/design-for-writers-book-cover-tf-2-a-million-to-one (1).webp',
                ))),
      ),
    );
  }
}
