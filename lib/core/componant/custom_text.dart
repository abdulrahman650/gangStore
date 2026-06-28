import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
     this.color,
     this.size,
    this.maxLines,
     this.weight});

 final String text;
 final Color? color;
 final double? size;
 final FontWeight? weight;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textScaler: TextScaler.linear(1.0),
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
      ),
    );
  }
}
