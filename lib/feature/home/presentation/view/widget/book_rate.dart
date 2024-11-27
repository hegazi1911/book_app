import 'package:book_app/core/utils/style.dart';
import 'package:flutter/material.dart';

class BookRate extends StatelessWidget {
  const BookRate({super.key, this.mainAxisAlignment = MainAxisAlignment.start});
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: const [
        Icon(
          Icons.star,
          color: Color(0xffFFDD4f),
        ),
        Text(
          '4.8',
          style: Styles.textstyle16,
        ),
        Text(
          '(245)',
          style: Styles.textstyle14,
        )
      ],
    );
  }
}
