import 'package:book_app/core/utils/app_routes.dart';
import 'package:book_app/core/utils/service_locator.dart';
import 'package:book_app/feature/home/data/repos/home_repo.dart';
import 'package:book_app/feature/home/data/repos/home_repo_impl.dart';
import 'package:book_app/feature/home/presentation/manger/best%20salier/best_salier_books_cubit.dart';
import 'package:book_app/feature/home/presentation/manger/featuredBooks/featured_books_cubit.dart';
import 'package:book_app/feature/splash/Presentation/view/SplachView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  setup();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => BestSalierBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchBestSalierBooks('Islamic'),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xff100B20),
        ),
      ),
    );
  }
}
