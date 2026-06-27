import 'package:gang_store/core/componant/app_colors.dart';
import 'package:gang_store/features/gang_store/home/widgets/details_product.dart';
import 'package:gang_store/features/gang_store/home/widgets/products_item.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:gang_store/features/gang_store/home/widgets/food_category.dart';
import 'package:gang_store/features/gang_store/home/widgets/search_field.dart';
import 'package:gang_store/features/gang_store/home/widgets/user_header.dart';

import '../../../core/componant/custom_text.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TextEditingController controller = TextEditingController();
  List category = ["Beauty", "Fragrances", "Furniture", "other",];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomScrollView(
          slivers: [
            //header
            SliverAppBar(
              elevation: 0,
              scrolledUnderElevation: 0,
              backgroundColor: Colors.white,
              toolbarHeight: 160,
              floating: false,
              pinned: true,
              automaticallyImplyLeading: false,
              flexibleSpace: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  right: 20,
                  left: 20,
                  bottom: 10,
                ),
                child: Column(
                  children: [
                    UserHeader(
                      userImage:
                          "assets/images/profilemw.jpg",
                      userName: " My Dear",
                    ),
                    Gap(10),
                    SearchField(
                      controller: controller,
                      onChanged: (value) {
                        final query = value.toLowerCase();
                        setState(() {
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Categories",
                      size: 20,
                      weight: FontWeight.w700,
                      color: AppColors.black,
                    ),
                  ],
                ),
              ),
            ),
            /// Category
            SliverToBoxAdapter(
              child: SizedBox(
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 5,
                  ),
                  child: FoodCategory(
                    selectedIndex: selectedIndex,
                    category: category,
                  ),
                ),
              ),
            ),
            //products
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return ProductItem(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const DetailsProduct(),
                            ),
                          );
                        },
                      );
                },
                childCount: 10,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.65,
              ),
                              ),
            ),

          ],
        ),
      ),

    );
  }
}
