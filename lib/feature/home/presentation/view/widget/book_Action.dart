import 'package:book_app/feature/home/data/model/book_model/book_model.dart';
import 'package:book_app/feature/home/presentation/view/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              backgroundColor: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  topLeft: Radius.circular(16)),
              text: 'Free',
              textColor: Colors.black,
            ),
          ),
          Expanded(
            child: CustomButton(
              function: () async {
                Uri uri = Uri.parse(bookModel.volumeInfo!.previewLink!);

                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              backgroundColor: Color(0xffEF8262),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
              text: 'Free Preview',
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
