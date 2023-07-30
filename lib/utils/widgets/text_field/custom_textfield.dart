import 'package:flutter/material.dart';

import '../../../style/style.dart';

class CustomTextField extends StatelessWidget {


 String name;
 TextEditingController controller =TextEditingController();



   CustomTextField({
    Key? key,
    required this.name,
    required this.controller

  }) :  super(key: key);



  @override
  Widget build(BuildContext context) {
    
    return TextField(
      controller: controller,
      decoration:  InputDecoration(
    focusedBorder: OutlineInputBorder( 
      borderSide: BorderSide(
        color: colorGreen,width: 1,
      ),
    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: colorWhite,width: 0.0
      ),
    ),
    border: OutlineInputBorder(),
    labelText: name
  )
      
    );
  }
}