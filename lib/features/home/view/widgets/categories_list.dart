import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  final List<String> categories;
  final String selectedCategory;
  final Function(String) onCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 60,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            final isSelected = category == selectedCategory;

            return InkWell(
              onTap: () => onCategoryChanged(category),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Chip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    side: BorderSide(color: Colors.transparent),
                    label: Text(category),
                    backgroundColor: isSelected
                        ? Theme.of(context).primaryColor
                        : const Color.fromARGB(255, 223, 223, 223),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
