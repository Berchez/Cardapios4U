import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color colors;
  final FontWeight weight;
  final TextAlign align;
  final TextOverflow overflow;

    const CustomText(
      {Key? key, this.text = 'null',
      this.size = 16.0,
      this.colors = Colors.black,
      this.weight = FontWeight.normal,
      this.align = TextAlign.left,
      this.overflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: size,
        color: colors,
        fontWeight: weight,
        overflow: overflow
      ),
    );
  }
}
