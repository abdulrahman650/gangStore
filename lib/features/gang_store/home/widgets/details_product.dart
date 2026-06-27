import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gang_store/core/componant/custom_text.dart';
import 'package:gang_store/features/gang_store/home/widgets/section_background_datiles.dart';
import 'package:gang_store/features/gang_store/home/widgets/section_title_decs.dart';
import 'package:gap/gap.dart';

import '../../../../core/componant/app_colors.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 900,
                child: Stack(
                  children: [
                    SectionBackgroundDatiles(),
                    SectionTitleDesc(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
