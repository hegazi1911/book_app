import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListBooks extends StatelessWidget {
  const ShimmerListBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 3,
        itemBuilder: (context, index) {
          return ShimmerListItem();
        });
  }
}

class ShimmerListItem extends StatelessWidget {
  const ShimmerListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        shimmerItems(),
        shimmerItems(),
        shimmerItems(),
        shimmerItems(),
        shimmerItems(),
        shimmerItems(),
      ],
    );
  }
}

class shimmerItems extends StatelessWidget {
  const shimmerItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
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
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Color.fromARGB(255, 53, 38, 105),
                  highlightColor: Color.fromARGB(135, 123, 104, 184),
                  child: Container(
                    height: 16,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Shimmer.fromColors(
                  baseColor: Color.fromARGB(255, 53, 38, 105),
                  highlightColor: Color.fromARGB(135, 123, 104, 184),
                  child: Container(
                    height: 14,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
