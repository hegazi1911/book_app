// import 'package:flutter/material.dart';

// class CategoryList extends StatelessWidget {
//   const CategoryList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         ButtonList(
//           TextCategory: 'programing',
//         ),
//         ButtonList(
//           TextCategory: 'computer Since',
//         ),
//         ButtonList(
//           TextCategory: 'Romantic',
//         ),
//         ButtonList(
//           TextCategory: 'islamic',
//         ),
//       ],
//     );
//   }
// }

// class ButtonList extends StatelessWidget {
//   final String TextCategory;
//   const ButtonList({
//     super.key,
//     required this.TextCategory,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//         onPressed: () {
//           String SelectCategory = TextCategory;
//         },
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(13),
//             color: Colors.white,
//           ),
//           child: Text(
//             TextCategory,
//             style: const TextStyle(color: Color(0xff100B20)),
//           ),
//         ));
//   }
// }
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  final Function(String) onCategorySelected;

  const CategoryList({super.key, required this.onCategorySelected});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  // Initial category
  String _activeCategory = 'Islamic';

  final List<String> categories = [
    'Islamic',
    'Programming',
    'Computer Science',
    'Markting',
    'interior design'
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          final isActive = _activeCategory == category;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isActive ? Colors.blue : Colors.grey[300],
              ),
              onPressed: () {
                setState(() {
                  _activeCategory = category; // Update active category
                });
                widget.onCategorySelected(category); // Notify parent
              },
              child: Text(
                category,
                style: TextStyle(
                  color: isActive ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
