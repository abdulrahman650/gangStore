
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gang_store/core/constant/app_colors.dart';
import 'package:gap/gap.dart';

import '../../../../core/componant/custom_text.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    required this.brand,
    required this.desc,
    required this.rate,
    required this.price,
    required this.afterPrice


  });

  final VoidCallback? onTap;
  final String image, title, desc, rate,price,afterPrice,brand;


  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primary.withOpacity(0.3),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 6,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(14),
                    ),
                    child:
                    Image.network(
                      image,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.image_not_supported),
                        );
                      },
                    )
                  ),
                  PositionedDirectional(
                    top: screenSize.height * 0.01,
                    end: screenSize.width * 0.02,
                    child: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          CupertinoIcons.heart,
                          color: AppColors.primary,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  PositionedDirectional(
                    top: screenSize.height * 0.01,
                    start: 10,
                    child: Container(
                      height: 25,
                      width: 50,
                      decoration: BoxDecoration(
                        color: AppColors.pincy,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: CustomText(text: "-10%", color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: brand,

                      size: 9,
                      weight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                    CustomText(
                      text: desc,
                      size: 12,
                      weight: FontWeight.w700,
                      color: AppColors.black,
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.star_fill,
                          size: 12,
                          color: Colors.yellow.shade500,
                        ),
                        Gap(6),
                        CustomText(
                          text: rate,
                          size: 14,
                          weight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                        Spacer(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                               Icon(CupertinoIcons.money_dollar, size: 20),
                              CustomText(
                                text: price,
                                size: 14,
                                weight: FontWeight.bold,
                                color: AppColors.primary,
                              ),
                              Gap(5),
                              Text(
                                afterPrice,
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
