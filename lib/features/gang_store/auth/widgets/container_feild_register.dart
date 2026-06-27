import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/componant/app_colors.dart';
import '../../../../core/componant/custom_Auth_button.dart';
import '../../../../core/componant/custom_text.dart';
import '../../../../core/componant/custom_textFeild.dart';
import '../../layout/layout.dart';
import '../sign_in.dart';
import '../sign_up.dart';

class ContainerFeildRegister extends StatefulWidget {
  ContainerFeildRegister({super.key});

  @override
  State<ContainerFeildRegister> createState() => _ContainerFeildRegisterState();
}

class _ContainerFeildRegisterState extends State<ContainerFeildRegister> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.grey[500]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Gap(30),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "First Name",
                      size: 14,
                      weight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                    CustomTextfeild(
                      controller: firstNameController,
                      isPassword: false,
                      label: 'First Name',
                    ),
                  ],
                ),
              ),
              const Gap(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Last Name",
                      size: 14,
                      weight: FontWeight.w500,
                      color: AppColors.white,
                    ),

                    CustomTextfeild(
                      controller: lastNameController,
                      label: 'Last Name',
                      isPassword: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(15),
          CustomText(
            text: "Email",
            size: 14,
            weight: FontWeight.w500,
            color: AppColors.white,
          ),
          CustomTextfeild(
            controller: emailController,

            label: 'Email',
            isPassword: false,
          ),
          const Gap(15),
          CustomText(
            text: "Password",
            size: 14,
            weight: FontWeight.w500,
            color: AppColors.white,
          ),
          CustomTextfeild(
            controller: passController,
            label: '*********',
            isPassword: true,
          ),
          const Gap(24),
          CustomText(
            text: "Confirm Password",
            size: 14,
            weight: FontWeight.w500,
            color: AppColors.white,
          ),
          CustomTextfeild(
            controller: confirmPassController,
            label: '***********',
            isPassword: true,
          ),
          const Gap(30),
          CustomAuthButton(
            textColor:AppColors.blue,
            color: Colors.white,
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) =>  Layout()));},
            text: "Register",
          ),
          const Gap(15),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Already have an account?",
                size: 16,
                weight: FontWeight.w500,
                color: AppColors.white,
              ),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignIn()));},
                child: CustomText(
                  text: " Sign In",
                  size: 16,
                  weight: FontWeight.w500,
                  color: AppColors.blue,
                ),),
            ],
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
