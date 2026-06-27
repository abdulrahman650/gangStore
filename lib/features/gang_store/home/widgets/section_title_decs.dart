import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/componant/app_colors.dart';
import '../../../../core/componant/custom_text.dart';

class SectionTitleDesc extends StatelessWidget {
  const SectionTitleDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 350,
      left: 0,
      right: 0,
      child: Container(
          padding: const EdgeInsets.all(24),
          height: 500,
          decoration: BoxDecoration(
            color:AppColors.white,

          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(16),
              CustomText(text: "Dolce & Gabbana",
              color: AppColors.grey,
              ),
              CustomText(
                text: "Dolce Shine Eau de",
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
                    text: " 4.0",
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
                    text: "69.56 L.E ",
                    size: 30.0,
                    weight:FontWeight.w900,
                  ),
                  Text(
                    "69.99 L.E ",
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      fontSize:  16,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,

                    ),)
                  ,CustomText(
                    text: "Save 0.43 L.E",
                    size: 14.0,
                    weight:FontWeight.w500,
                    color: Colors.green,
                  )

                ],
              ),
               Gap(30),
               CustomText(
                text: "Description",
                size: 16,
                weight: FontWeight.w700,
                color: AppColors.black,
              ),
               Gap(10),
               CustomText(
                text: "Dolce Shine by Dolce & Gabbana is a vibrant and\nfruity fragrance, featuring notes of mango, jasmine,\n and blonde woods. It's a joyful and youthful scent.",
                size: 13,
                weight: FontWeight.w400,
                color: AppColors.grey,
              ),
            ],
          )),
    );
  }
}
