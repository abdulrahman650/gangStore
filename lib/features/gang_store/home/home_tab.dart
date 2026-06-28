import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/componant/custom_text.dart';
import '../../../core/constant/app_colors.dart';
import 'data/product_model.dart';
import 'data/product_repo.dart';
import 'widgets/details_product.dart';
import 'widgets/products_item.dart';
import 'widgets/search_field.dart';
import 'widgets/tabs_category.dart';
import 'widgets/user_header.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final TextEditingController controller = TextEditingController();

  final ProductRepo productRepo = ProductRepo();

  bool isLoading = true;

  int selectedIndex = 0;

  List<String> categoryTabs = [
    "All",
    "beauty",
    "fragrances",
    "furniture",
  ];

  List<ProductModel> allProducts = [];
  List<ProductModel> products = [];
  List<ProductModel> categoryProducts = [];
  /// Get All Products
  Future<void> getProducts() async {
    setState(() {
      isLoading = true;
    });

    final response = await productRepo.getProducts();

    setState(() {
      isLoading = false;
      allProducts = response;
      categoryProducts = response;
      products = response;
    });
  }
  /// Filter By Category
  Future<void> filterProducts(String category) async {
    setState(() {
      isLoading = true;
    });

    List<ProductModel> response;

    if (category == "All") {
      response = await productRepo.getProducts();
    } else {
      response = await productRepo.getProductsByCategory(category);
    }

    setState(() {
      categoryProducts = response;
      products = controller.text.isEmpty
          ? response
          : allProducts.where((product) {
        final query = controller.text.toLowerCase();

        return product.title.toLowerCase().contains(query) ||
            product.brand.toLowerCase().contains(query);
      }).toList();

      isLoading = false;
    });
  }
  /// seachProducts
  void searchProducts(String value) {
    if (value.trim().isEmpty) {
      setState(() {
        products = categoryProducts;
      });
      return;
    }
    final query = value.toLowerCase();
    final result = allProducts.where((product) {
      return product.title.toLowerCase().contains(query) ||
          product.brand.toLowerCase().contains(query);
    }).toList();

    setState(() {
      products = result;
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: CustomScrollView(
            slivers: [
              /// Header
              SliverAppBar(
                elevation: 0,
                scrolledUnderElevation: 0,
                backgroundColor: Colors.white,
                toolbarHeight: 160,
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
                        userImage: "assets/images/profilemw.jpg",
                        userName: "My Dear",
                      ),
                      const Gap(10),
                      /// Search
                      SearchField(
                        controller: controller,
                        onChanged: searchProducts,
                      ),
                    ],
                  ),
                ),
              ),
              /// Categories Title
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomText(
                    text: "Categories",
                    size: 20,
                    weight: FontWeight.w700,
                    color: AppColors.black,
                  ),
                ),
              ),
              /// Category Tabs
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    child: CategoryTabs(
                      selectedIndex: selectedIndex,
                      category: categoryTabs,
                      onTap: (index) async {
                        setState(() {
                          selectedIndex = index;
                        });

                        await filterProducts(
                          categoryTabs[index],
                        );
                      },
                    ),
                  ),
                ),
              ),

              /// Products
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      final product = products[index];

                      return ProductItem(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailsProduct(
                                product: product,
                              ),
                            ),
                          );
                        },
                        image: product.image,
                        brand: product.brand,
                        title: product.title,
                        desc: product.desc,
                        rate: product.rate.toString(),
                        price: product.price.toString(),
                        afterPrice:
                          "\$${(product.price / (1 - product.afterPrice / 100)).toStringAsFixed(2)}",
                      );
                    },
                    childCount: products.length,
                  ),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
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
      ),
    );
  }
}