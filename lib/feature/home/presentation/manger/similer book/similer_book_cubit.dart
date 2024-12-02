import 'package:bloc/bloc.dart';
import 'package:book_app/feature/home/data/model/book_model/book_model.dart';
import 'package:book_app/feature/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similer_book_state.dart';

class SimilerBookCubit extends Cubit<SimilerBookState> {
  SimilerBookCubit(this.homeRepo) : super(SimilerBookInitial());

  final HomeRepo homeRepo;
  Future<void> fetchSimilerbooks(String Category) async {
    emit(SimilerBookLoading());

    var result = await homeRepo.fetchSimilerbooks(Category);

    result.fold(
      (failure) {
        emit(SimilerBookFailure(
          failure.errMassege,
        ));
      },
      (books) {
        emit(SimilerBookSuccess(books));
      },
    );
  }
}
