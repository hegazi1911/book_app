import 'package:book_app/feature/home/data/model/book_model/book_model.dart';
import 'package:book_app/feature/home/presentation/manger/similer%20book/similer_book_cubit.dart';
import 'package:book_app/feature/home/presentation/view/widget/book_detailes_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailes extends StatefulWidget {
  const BookDetailes({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookDetailes> createState() => _BookDetailesState();
}

class _BookDetailesState extends State<BookDetailes> {
  @override
  void initState() {
    BlocProvider.of<SimilerBookCubit>(context).fetchSimilerbooks(
        widget.bookModel.volumeInfo?.categories![0] ?? Icons.error.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BookDetailesBody(
      bookModel: widget.bookModel,
    ));
  }
}
