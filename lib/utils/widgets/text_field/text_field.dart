import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {


 String name;




   CustomTextField({
    Key? key,
    required this.name,



  }) :  super(key: key);



  @override
  Widget build(BuildContext context) {
    
    return TextField(

      decoration: InputDecoration(
        hintText: "Logan Paul",
        hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
        labelText: name,
        labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
      ),
      
    );
  }
}