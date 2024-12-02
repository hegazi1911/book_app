import 'package:book_app/core/error/failure.dart';
import 'package:book_app/core/utils/api_service.dart';
import 'package:book_app/feature/home/data/model/book_model/book_model.dart';
import 'package:book_app/feature/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSillerbooks(
      String category) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering-free-ebooks&Sorting=newst &q=subject:$category');
      debugPrint("data is $data");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      debugPrint(books.toString());
      return right(books);
    } catch (e) {
      if (e is DioException) {
        debugPrint(e.stackTrace.toString());
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMassege: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering-free-ebooks&q=subject:Programming');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      Println(e.toString());
      if (e is DioException) {
        Println(e.stackTrace.toString());

        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(errMassege: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilerbooks(
      String category) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering-free-ebooks&Sorting=newst &q=subject:$category');
      debugPrint("data is $data");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      debugPrint(books.toString());
      return right(books);
    } catch (e) {
      if (e is DioException) {
        debugPrint(e.stackTrace.toString());
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(errMassege: e.toString()));
    }
  }
}
