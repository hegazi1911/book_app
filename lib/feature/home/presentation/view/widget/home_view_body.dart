import 'package:book_app/core/utils/app_routes.dart';
import 'package:book_app/core/utils/style.dart';
import 'package:book_app/feature/home/presentation/view/widget/best_siller_item.dart';
import 'package:book_app/feature/home/presentation/view/widget/custom_app_bar.dart';
import 'package:book_app/feature/home/presentation/view/widget/feature_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(),
                FeatureListView(),
                SizedBox(
                  height: 50,
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
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                  onTap: () =>
                      GoRouter.of(context).push(AppRouter.kBookDetailes),
                  child: const BestSellerListViewItem()),
            );
          }),
    );
  }
}
