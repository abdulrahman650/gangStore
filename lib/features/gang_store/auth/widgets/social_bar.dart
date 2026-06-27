import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/componant/app_colors.dart';
import '../../../../core/componant/custom_text.dart';

class SocialBar extends StatelessWidget {
  const SocialBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 5, color: Colors.white),
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/appleIcon.svg",),
                CustomText(
                  text: "  Apple",
                  size: 16,
                  weight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),   const Gap(10),

         Expanded(
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 5, color: Colors.white),
            ),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/googleIcon.svg"),
                CustomText(
                  text: "  Google",
                  size: 16,
                  weight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
