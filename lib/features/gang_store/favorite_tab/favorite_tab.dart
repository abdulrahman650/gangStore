import 'package:flutter/material.dart';

import '../../../core/componant/app_colors.dart';


class favoriteTab extends StatelessWidget {
  const favoriteTab({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Favorite Tab",
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