import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/componant/custom_text.dart';
import '../data/product_model.dart';

class SectionTitleDesc extends StatelessWidget {
  const SectionTitleDesc({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 400,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.all(24),
        height: 1000,
        decoration: BoxDecoration(color: AppColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(16),
            CustomText(text: product.brand, color: AppColors.grey),
            CustomText(
              text: product.title,
              size: 24,
              weight: FontWeight.w700,
              color: AppColors.black,
            ),
            Row(
              children: [
                SvgPicture.asset("assets/icons/star1.svg"),
                SvgPicture.asset("assets/icons/star1.svg"),
                SvgPicture.asset("assets/icons/star1.svg"),
                SvgPicture.asset("assets/icons/star1.svg"),
                SvgPicture.asset("assets/icons/darkStar.svg"),
                CustomText(
                  text: product.rate.toString(),
                  weight: FontWeight.w700,
                  color: AppColors.black,
                  size: 14,
                ),
                CustomText(
                  text: " (3 reviews)",
                  weight: FontWeight.w400,
                  color: AppColors.grey,
                  size: 14,
                ),
              ],
            ),
            Gap(16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  text: "${product.price} L.E",
                  size: 30.0,
                  weight: FontWeight.w900,
                ),
                Gap(6),
                Text(
                  "\$${(product.price / (1 - product.afterPrice / 100)).toStringAsFixed(2)}",
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                  ),
                ),
                Gap(6),
                CustomText(
                  text:
                  "Save ${((product.price / (1 - product.afterPrice / 100)) - product.price).toStringAsFixed(2)} L.E",
                  size: 14,
                  weight: FontWeight.w500,
                  color: Colors.green,
                ),
              ],
            ),
            Gap(30),
            CustomText(
              text: product.desc,
              size: 16,
              weight: FontWeight.w700,
              color: AppColors.black,
              maxLines: 6,
            ),
            Gap(10),
          ],
        ),
      ),
    );
  }
}
