part of 'similer_book_cubit.dart';

sealed class SimilerBookState extends Equatable {
  const SimilerBookState();

  @override
  List<Object> get props => [];
}

final class SimilerBookInitial extends SimilerBookState {}

final class SimilerBookLoading extends SimilerBookState {}

final class SimilerBookFailure extends SimilerBookState {
  final String errMasseg;

  SimilerBookFailure(this.errMasseg);
}

final class SimilerBookSuccess extends SimilerBookState {
  final List<BookModel> bookModel;

  SimilerBookSuccess(this.bookModel);
}
