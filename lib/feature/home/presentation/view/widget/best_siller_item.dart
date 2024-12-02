import 'package:book_app/core/utils/app_routes.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:book_app/feature/home/data/model/book_model/book_model.dart';
import 'package:book_app/feature/home/presentation/view/widget/book_rate.dart';
import 'package:book_app/feature/home/presentation/view/widget/custom_book_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          GoRouter.of(context).push(AppRouter.kBookDetailes, extra: bookModel),
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            CustomBookImage(
                imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? ''),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        bookModel.volumeInfo?.title ?? "title",
                        style: Styles.textStyle20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    bookModel.volumeInfo?.authors?[0] ?? "0",
                    style: Styles.textstyle14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        'Free',
                        style: Styles.textStyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      BookRate()
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
