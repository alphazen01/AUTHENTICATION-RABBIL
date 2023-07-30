import 'package:flutter/material.dart';

import '../../../style/style.dart';

class SubmitButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
   SubmitButton({
    Key? key,
    required this.title,
    required this.onTap,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorGreen,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          child: Text(
            title,
            style: ButtonTextstyle(colorWhite)
            ),
        )
        
      ),
    );
  }
}