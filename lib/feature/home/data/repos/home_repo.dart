import 'package:book_app/core/error/failure.dart';
import 'package:book_app/feature/home/data/model/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestSillerbooks(
      final String category);
  Future<Either<Failure, List<BookModel>>> fetchSimilerbooks(
      final String category);
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
}
