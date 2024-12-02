import 'package:bloc/bloc.dart';
import 'package:book_app/feature/home/data/model/book_model/book_model.dart';
import 'package:book_app/feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'best_salier_books_state.dart';

class BestSalierBooksCubit extends Cubit<BestSalierBooksState> {
  BestSalierBooksCubit(
    this.homeRepo,
  ) : super(BestSalierBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchBestSalierBooks(String category) async {
    emit(BestSalierBooksLoading());

    var result = await homeRepo.fetchBestSillerbooks(category);

    result.fold(
      (failure) {
        emit(BestSalierBooksFalier(
          failure.errMassege,
        ));
      },
      (books) {
        emit(BestSalierBooksSucces(books));
      },
    );
  }
}
