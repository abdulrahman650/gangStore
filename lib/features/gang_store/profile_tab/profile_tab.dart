import 'package:flutter/material.dart';

import '../../../core/constant/app_colors.dart';


class profileTab extends StatelessWidget {
  const profileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Communities Tab",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
          ),
        ),
      ),
    );
  }
}
