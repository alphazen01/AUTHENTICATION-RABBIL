import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorDark = Color.fromRGBO(136, 28, 32, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorBlue = Color.fromRGBO(52, 152, 219, 1.0);
const colorOrange = Color.fromRGBO(231, 28, 36, 1);
const colorWhite = Color.fromRGBO(255, 255, 255, 1);
const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1);
const colorLightGray = Color.fromRGBO(135, 142, 158, 1);
const colorLight = Color.fromRGBO(211, 211, 211, 1);


//textStyle
//headLineText

TextStyle Head1Text(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 28,
    fontWeight: FontWeight.w700
  );
}

TextStyle Head6Text(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 16,
    fontWeight: FontWeight.w400
  );
}

//inputDecoration

InputDecoration AppInputDecoration(label){
  return InputDecoration(
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
    labelText: label
  );
}


//dropDown

DecoratedBox AppDropDownStyle(child){
  return DecoratedBox(
  decoration: BoxDecoration(
    color: Colors.white,
    border:Border.all(color: Colors.white,width: 1),
    borderRadius: BorderRadius.circular(4) 
  ),
  child: Padding(
  padding:EdgeInsets.only(left: 30,right: 30),
  child: child, 
  ),
  );
}

//backgroundPhoto
SvgPicture ScreenBackground(context){
  return SvgPicture.asset(
    "",
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}

//button
ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
    
   elevation: 1,
 
   primary: colorGreen,
   shape:RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(6)
   ),
    
   
  );
}
//buttonTextstyle
TextStyle ButtonTextstyle(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 14,
    fontWeight: FontWeight.w600
  );
}

//buttonColor

Ink SuccessButtonChild(String ButtonText){
  return Ink(
    decoration: BoxDecoration(
      color: colorGreen,
      borderRadius: BorderRadius.circular(6)
    ),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
      ButtonText,
      style: ButtonTextstyle(colorWhite),
      )
    ),
  );
}

//flutterToast

void SuccessToast(msg){
Fluttertoast.showToast(
msg:msg,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 1,
toastLength: Toast.LENGTH_SHORT,
backgroundColor: colorGreen,
textColor: colorWhite,
fontSize: 16 
);
}

void ErrorToast(msg){
Fluttertoast.showToast(
msg:msg,
gravity: ToastGravity.BOTTOM,
timeInSecForIosWeb: 1,
toastLength: Toast.LENGTH_SHORT,
backgroundColor: colorRed,
textColor: colorWhite,
fontSize: 16 
);
}


//padding

const paddingX = 10.0;
const paddingY = 10.0;


//pinstyle

PinTheme AppOtpStyle(){
  return PinTheme(
    inactiveColor: colorLight,
    inactiveFillColor: colorWhite,
    selectedColor: colorGreen,
    activeColor: colorWhite,
    selectedFillColor: colorGreen,
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    borderWidth: 0.5,
    fieldWidth: 45,
    activeFillColor: Colors.white
  );
}