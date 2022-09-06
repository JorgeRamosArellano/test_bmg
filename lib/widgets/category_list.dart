
import 'package:flutter/material.dart';
import 'package:test_bmg/models/categories.dart';
import 'package:test_bmg/widgets/widgets.dart';

class CategoryList extends StatefulWidget {
  final void Function(String) categorySelected;
  const CategoryList({
    Key? key, required this.categorySelected,
  }) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String categorySelected = 'Entertainment';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < Categories.allCategories.length; i++)
            Row(
              children: [
                CategoryBox(
                  selected: categorySelected == Categories.allCategories[i] ? true : false,
                  text: Categories.allCategories[i],
                  onPressed: () {
                    categorySelected = Categories.allCategories[i];
                    widget.categorySelected(categorySelected);
                    setState(() {});
                  },
                ),
                const SizedBox(width: 10),
              ],
            ),
        ],
      ),
    );
  }
}