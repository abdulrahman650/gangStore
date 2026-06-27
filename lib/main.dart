import 'package:flutter/material.dart';
import 'package:gang_store/features/gang_store/auth/sign_in.dart';
import 'package:gang_store/features/gang_store/layout/layout.dart';

import 'features/gang_store/home/home_tab.dart';
import 'features/gang_store/home/widgets/details_product.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SignIn(),
    );
  }
}