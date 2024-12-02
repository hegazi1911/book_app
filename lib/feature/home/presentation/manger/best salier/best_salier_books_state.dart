part of 'best_salier_books_cubit.dart';

sealed class BestSalierBooksState extends Equatable {
  const BestSalierBooksState();

  @override
  List<Object> get props => [];
}

final class BestSalierBooksInitial extends BestSalierBooksState {}

final class BestSalierBooksLoading extends BestSalierBooksState {}

final class BestSalierBooksFalier extends BestSalierBooksState {
  final String errMasseg;

  const BestSalierBooksFalier(this.errMasseg);
}

final class BestSalierBooksSucces extends BestSalierBooksState {
  final List<BookModel> books;

  const BestSalierBooksSucces(this.books);
}
