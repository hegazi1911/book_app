import 'package:book_app/core/utils/style.dart';
import 'package:book_app/core/widgets/custom_error.dart';
import 'package:book_app/feature/home/data/model/book_model/book_model.dart';
import 'package:book_app/feature/home/presentation/manger/similer%20book/similer_book_cubit.dart';
import 'package:book_app/feature/home/presentation/view/widget/book_Action.dart';
import 'package:book_app/feature/home/presentation/view/widget/book_rate.dart';
import 'package:book_app/feature/home/presentation/view/widget/custom_app_bar_book.dart';
import 'package:book_app/feature/home/presentation/view/widget/custom_book_image.dart';
import 'package:book_app/feature/home/presentation/view/widget/feature_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailesBody extends StatelessWidget {
  const BookDetailesBody({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    return BlocBuilder<SimilerBookCubit, SimilerBookState>(
      builder: (context, state) {
        if (state is SimilerBookSuccess) {
          return CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SafeArea(child: CustomBookAppBar()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: Width * .17),
                        child: CustomBookImage(
                            imageUrl:
                                bookModel.volumeInfo?.imageLinks?.thumbnail ??
                                    ""),
                      ),
                      SizedBox(
                        height: 43,
                      ),
                      Text(
                        bookModel.volumeInfo?.title ?? " ",
                        style: Styles.textStyle30,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        bookModel.volumeInfo?.authors?[0] ?? '',
                        style: Styles.textstyle18,
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      BookRate(
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      BooksAction(
                        bookModel: bookModel,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'you can also like ',
                          style: Styles.textstyle14,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      FeatureListView(
                        number: 0.15,
                      ),
                      SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        } else if (state is SimilerBookFailure) {
          return CustomError(errMesage: state.errMasseg);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
