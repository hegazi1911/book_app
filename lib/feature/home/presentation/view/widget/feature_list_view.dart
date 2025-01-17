import 'package:book_app/core/widgets/custom_error.dart';
import 'package:book_app/feature/home/presentation/manger/featuredBooks/featured_books_cubit.dart';
import 'package:book_app/feature/home/presentation/view/widget/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class FeatureListView extends StatelessWidget {
  const FeatureListView({
    super.key,
    required this.number,
  });
  final double number;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * number,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: CustomBookImage(
                        imageUrl: state.books[index].volumeInfo?.imageLinks
                                ?.thumbnail ??
                            'assets/images/design-for-writers-book-cover-tf-2-a-million-to-one (1).webp'),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomError(errMesage: state.errMessage);
        } else {
          return ShimmerBooks();
        }
      },
    );
  }
}

class ShimmerBooks extends StatelessWidget {
  const ShimmerBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        shimmer(),
        shimmer(),
        shimmer(),
      ],
    );
  }
}

class shimmer extends StatelessWidget {
  const shimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Shimmer.fromColors(
        baseColor: Color.fromARGB(255, 53, 38, 105),
        highlightColor: Color.fromARGB(135, 123, 104, 184),
        child: Container(
          width: 80,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
