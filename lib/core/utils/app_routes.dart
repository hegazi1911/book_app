import 'package:book_app/core/utils/service_locator.dart';
import 'package:book_app/feature/home/data/model/book_model/book_model.dart';
import 'package:book_app/feature/home/data/repos/home_repo_impl.dart';
import 'package:book_app/feature/home/presentation/manger/similer%20book/similer_book_cubit.dart';
import 'package:book_app/feature/home/presentation/view/book_detailes.dart';
import 'package:book_app/feature/home/presentation/view/home_view.dart';
import 'package:book_app/feature/search/presentation/view/searchView.dart';
import 'package:book_app/feature/splash/Presentation/view/SplachView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeRouter = '/homeView';
  static const kBookDetailes = '/BookDetailes';
  static const kSearchview = '/Searchview';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplachView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/Searchview',
        builder: (context, state) => const Searchview(),
      ),
      GoRoute(
        path: '/BookDetailes',
        builder: (context, state) => BlocProvider(
          create: (context) => SimilerBookCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailes(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
    ],
  );
}
