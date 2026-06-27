import 'package:flutter/material.dart';
import 'package:gang_store/features/gang_store/auth/widgets/container_feild_login.dart';
import 'package:gang_store/features/gang_store/auth/widgets/logo_bar_signIn.dart';
import 'package:gang_store/features/gang_store/auth/widgets/social_bar.dart';
import 'package:gap/gap.dart';
import '../../../core/componant/app_colors.dart';
import '../../../core/componant/custom_text.dart';

class SignIn extends StatefulWidget {
  SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                      LogoBarSignIn(),
                      const Gap(24),
                      CustomText(
                        text: "Sign in",
                        size: 32,
                        weight: FontWeight.w700,
                        color: AppColors.black,
                      ),
                      CustomText(
                        text: "Welcome back to GANG",
                        size: 16,
                        weight: FontWeight.w500,
                        color: AppColors.grey,
                      ),
                      const Gap(40),
                      // Form container
                      ContainerFeildLogin(),
                      const Gap(20),
                      //divider
                      Row(
                        children: [
                          Expanded(child: Divider(color: AppColors.black)),
                          CustomText(
                            text: "   OR CONTINUE WITH  ",
                            size: 16,
                            weight: FontWeight.w500,
                            color: AppColors.grey,
                          ),
                          Expanded(child: Divider(color: AppColors.black)),
                        ],
                      ),
                      const Gap(20),
                      SocialBar(),
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
