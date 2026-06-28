import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gang_store/features/gang_store/layout/layout.dart';
import '../data/product_model.dart';

class SectionBackgroundDatiles extends StatelessWidget {
  const SectionBackgroundDatiles({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            ClipRRect(
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(14)),
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
            ),
            PositionedDirectional(
              top: 15,
              end: 10,
              child:  Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color:Colors.grey[400],
                  borderRadius: BorderRadius.circular(12),

                ),
                child: Center(
                  child: Icon(Icons.share),
                ),
              ),

            ),
            PositionedDirectional(
              top: 15,
              end: 76,
              child:  Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color:Colors.grey[400],
                  borderRadius: BorderRadius.circular(12),

                ),
                child: Center(
                  child: SvgPicture.asset("assets/icons/loveIcon.svg"),
                ),
              ),

            ),
              PositionedDirectional(
                top: 15,
              start: 10,
              child:  Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color:Colors.grey[400],
                  borderRadius: BorderRadius.circular(12),
                  // border: Border.all(width: 5,color: Colors.white)
                ),
                child: Center(
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Layout()));
                    },
        child:
         SvgPicture.asset("assets/icons/arowback.svg")),
                ),
              ),

            ),
          ],
        ),

      ],
    );
  }
}
