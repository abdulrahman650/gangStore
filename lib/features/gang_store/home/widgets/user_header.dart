import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/componant/custom_text.dart';


class UserHeader extends StatelessWidget {
  const UserHeader(
      {super.key, required this.userName, required this.userImage});

  final String userName, userImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(30),
            CustomText(
              text: "Good morning 👋",
              size: 20,
              weight: FontWeight.w500,
              color: Colors.grey.shade500,
            ),
            Row(
              children: [
                CustomText(
                  text: "GANG",
                  size: 32,
                  weight: FontWeight.w700,
                  color: AppColors.blue,
                ), CustomText(
                  text: " STORE",
                  size: 32,
                  weight: FontWeight.w700,
                  color: AppColors.black,
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            radius: 22.0,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.notifications,
              size: 24,
              color: Colors.black,

            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: CircleAvatar(
            radius: 22.0,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.card_travel,
              size: 24,
              color: Colors.black,

            ),
          ),
        ),

        Container(
          height: 55,
          width: 55,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/img.png"),
                fit: BoxFit.cover,
              ),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(width: 5, color: Colors.white)
          ),
        ),
      ],
    );
  }
}
