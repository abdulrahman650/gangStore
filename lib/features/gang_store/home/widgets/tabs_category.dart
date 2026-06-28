import 'package:flutter/material.dart';
import 'package:gang_store/core/constant/app_colors.dart';

import '../../../../core/componant/custom_text.dart';

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({
    super.key,
    required this.selectedIndex,
    required this.category,
    required this.onTap,
  });

  final int selectedIndex;
  final List<String> category;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(category.length, (index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Container(
              margin: const EdgeInsets.only(right: 19),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? AppColors.blue
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: CustomText(
                text: category[index],
                weight: FontWeight.w600,
                color: selectedIndex == index
                    ? Colors.white
                    : Colors.grey.shade700,
              ),
            ),
          );
        }),
      ),
    );
  }
}