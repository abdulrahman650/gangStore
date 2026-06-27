import 'package:flutter/material.dart';

import '../../../core/componant/app_colors.dart';

class cartTab extends StatelessWidget {
  const cartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Cart Tab",  style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),),
      ),
    );
  }
}
