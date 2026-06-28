import 'package:flutter/material.dart';
import 'package:gang_store/features/gang_store/home/widgets/section_background_datiles.dart';
import 'package:gang_store/features/gang_store/home/widgets/section_title_decs.dart';
import 'package:gap/gap.dart';
import '../data/product_model.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(40),
            SizedBox(
              height: 900,
              child: Stack(
                children: [
                  SectionBackgroundDatiles( product: product,),
                  SectionTitleDesc( product: product,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
