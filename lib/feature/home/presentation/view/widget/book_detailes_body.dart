import 'package:book_app/core/utils/style.dart';
import 'package:book_app/feature/home/presentation/view/widget/book_Action.dart';
import 'package:book_app/feature/home/presentation/view/widget/book_rate.dart';
import 'package:book_app/feature/home/presentation/view/widget/custom_app_bar_book.dart';
import 'package:book_app/feature/home/presentation/view/widget/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailesBody extends StatelessWidget {
  const BookDetailesBody({super.key});

  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SafeArea(child: CustomBookAppBar()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Width * .17),
            child: CustomBookImage(),
          ),
          SizedBox(
            height: 43,
          ),
          Text(
            'The Jungle Book',
            style: Styles.textStyle30,
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            'Ahmed Hegazi',
            style: Styles.textstyle18,
          ),
          SizedBox(
            height: 18,
          ),
          BookRate(
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(
            height: 37,
          ),
          BooksAction()
        ],
      ),
    );
  }
}

// class Price extends StatelessWidget {
//   const Price({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           width: 150,
//           height: 48,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(16),
//               bottomLeft: Radius.circular(16),
//             ),
//             color: Colors.white,
//           ),
//           child: Center(
//             child: Text('19.99',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18)),
//           ),
//         ),
//         Container(
//           width: 150,
//           height: 48,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.only(
//               topRight: Radius.circular(16),
//               bottomRight: Radius.circular(16),
//             ),
//             color: const Color.fromARGB(255, 236, 151, 179),
//           ),
//           child: Center(
//             child: Text(
//               'Free Preview',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

