import 'package:flutter/material.dart';

import 'package:gang_store/features/gang_store/auth/widgets/container_feild_register.dart';
import 'package:gang_store/features/gang_store/auth/widgets/logo_bar_SignUp.dart';
import 'package:gap/gap.dart';

import '../../../core/constant/app_colors.dart';

import '../../../core/componant/custom_text.dart';


class SignUp extends StatelessWidget {
  SignUp({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(20),
                      // Logo
                      LogoBarSignUp(),
                      const Gap(24),
                      //Create account
                      CustomText(
                        text: "Create account",
                        size: 32,
                        weight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                      // Join GANG today
                      CustomText(
                        text: "Join GANG today",
                        size: 16,
                        weight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                      const Gap(40),
                      // Form container
                      ContainerFeildRegister(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
