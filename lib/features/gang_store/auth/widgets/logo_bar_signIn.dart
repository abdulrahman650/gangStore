import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/componant/app_colors.dart';
import '../../../../core/componant/custom_text.dart';

class   LogoBarSignIn extends StatelessWidget {
  const LogoBarSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(width: 5, color: Colors.white),
          ),
          child: Icon(Icons.flash_on, color: Colors.white,),
        ),
        CustomText(
          text: " GANG",
          size: 32,
          weight: FontWeight.w700,
          color: AppColors.black,
        ),
      ],
    );
  }
}
