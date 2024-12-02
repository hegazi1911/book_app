import 'package:book_app/core/utils/app_routes.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:book_app/core/widgets/custom_error.dart';
import 'package:book_app/feature/home/presentation/manger/best%20salier/best_salier_books_cubit.dart';
import 'package:book_app/feature/home/presentation/manger/featuredBooks/featured_books_cubit.dart';
import 'package:book_app/feature/home/presentation/view/widget/best_siller_item.dart';
import 'package:book_app/feature/home/presentation/view/widget/category_List.dart';
import 'package:book_app/feature/home/presentation/view/widget/custom_app_bar.dart';
import 'package:book_app/feature/home/presentation/view/widget/feature_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeatureListView(
                  number: 0.3,
                ),
                SizedBox(
                  height: 50,
                ),
                CategoryList(
                  onCategorySelected: (selectedCategory) {
                    BlocProvider.of<BestSalierBooksCubit>(context)
                        .fetchBestSalierBooks(selectedCategory);
                  },
                ),
                Text(
                  'Best Seller',
                  style: Styles.textStyle20,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: BestSillerListView(),
          ),
        )
      ],
    );
  }
}

class BestSillerListView extends StatelessWidget {
  const BestSillerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSalierBooksCubit, BestSalierBooksState>(
      builder: (context, state) {
        if (state is BestSalierBooksSucces) {
          return Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: BestSellerListViewItem(
                      bookModel: state.books[index],
                    ),
                  );
                }),
          );
        } else if (state is BestSalierBooksFalier) {
          return CustomError(errMesage: state.errMasseg);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
