import 'package:flutter/material.dart';
import 'package:gang_store/core/componant/app_colors.dart';

import '../../../../core/componant/custom_text.dart';


class FoodCategory extends StatefulWidget {
  const FoodCategory({super.key, required this.selectedIndex, required this.category});
  final  int selectedIndex;
  final List category;

  @override
  State<FoodCategory> createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  late  int selectedIndex;

@override
  void initState() {
   selectedIndex= widget.selectedIndex;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.category.length, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
               selectedIndex = index;
              });
            },
            child: Container(
              margin: EdgeInsets.only(right: 19),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? AppColors.blue
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: CustomText(
                text: widget.category[index],
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
