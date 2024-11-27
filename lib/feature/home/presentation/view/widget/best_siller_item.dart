import 'package:book_app/core/utils/style.dart';
import 'package:book_app/feature/home/presentation/view/widget/book_rate.dart';
import 'package:flutter/material.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
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
          ),
          SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      'Harry Poter and the Goblet of Fire',
                      style: Styles.textStyle20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                SizedBox(
                  height: 3,
                ),
                Text('J.K Rowling'),
                Row(
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      '19.99',
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
    );
  }
}
