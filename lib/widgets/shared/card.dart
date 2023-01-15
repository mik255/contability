


import 'package:flutter/material.dart';

class CustomCardWithImg extends StatelessWidget {
  const CustomCardWithImg({Key? key,required this.assetPath}) : super(key: key);
  final String assetPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 269,
      height: 170,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
      ),
      child: Image.asset(assetPath),
    );
  }
}
