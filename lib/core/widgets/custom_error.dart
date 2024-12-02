import 'package:book_app/core/utils/style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key, required this.errMesage});
  final String errMesage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errMesage,
      style: Styles.textstyle14,
    );
  }
}
