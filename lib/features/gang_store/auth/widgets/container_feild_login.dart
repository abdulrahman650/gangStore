import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/componant/app_colors.dart';
import '../../../../core/componant/custom_Auth_button.dart';
import '../../../../core/componant/custom_text.dart';
import '../../../../core/componant/custom_textFeild.dart';
import '../../layout/layout.dart';
import '../sign_up.dart';

class ContainerFeildLogin extends StatefulWidget {
   ContainerFeildLogin({super.key});

  @override
  State<ContainerFeildLogin> createState() => _ContainerFeildLoginState();
}

class _ContainerFeildLoginState extends State<ContainerFeildLogin> {
  bool rememberMe = false;

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
          //email
          const Gap(30),
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
          //Password
          const Gap(20),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                  TextButton(onPressed: (){
                    rememberMe= !rememberMe;
                    setState(() {
                    });
                  }, child: CustomText(text: "Remember Me",color: AppColors.white,),)

                ],
              ),
              TextButton(onPressed: (){}, child: CustomText(
                text: "Forgot Password?",
                size: 16,
                weight: FontWeight.w500,
                color: AppColors.blue,
              ),),

            ],
          ),
          const Gap(24),
          CustomAuthButton(
            textColor:AppColors.blue,
            color: Colors.white,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>  Layout()));
            },
            text: "Sign In",
          ),
          const Gap(15),
//signup button
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Already have an account?",
                size: 16,
                weight: FontWeight.w500,
                color: AppColors.white,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>  SignUp()));
                },
                child: CustomText(
                  text: " Sign Up",
                  size: 16,
                  weight: FontWeight.w500,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
          const Gap(10),
        ],
      ),
    );
  }
}
