import 'package:book_app/feature/home/presentation/view/book_detailes.dart';
import 'package:book_app/feature/home/presentation/view/home_view.dart';
import 'package:book_app/feature/splash/Presentation/view/SplachView.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeRouter = '/homeView';
  static const kBookDetailes = '/BookDetailes';

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
        path: '/BookDetailes',
        builder: (context, state) => const BookDetailes(),
      ),
    ],
  );
}
