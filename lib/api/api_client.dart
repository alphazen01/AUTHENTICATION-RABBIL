
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rabbil/utils/utility/utility.dart';



import '../style/style.dart';


var baseUrl = "https://task.teamrabbil.com/api/v1/";
var requestHeader ={
  "Content-Type":"aplication/json",
  
  };

// Map<String,String>FormValues={"email":"","firstName":"","lastName":"","mobile":"","password":"","photo":"",};
Future<bool>loginRequest(FormValues)async{
  var Url = Uri.parse("${baseUrl}/login");
  // var Url = Uri.parse("http://mvs.bslmeiyu.com/api/v1/auth/login");
  var PostBody = json.encode(FormValues);

  var response = await http.post(Url,headers: requestHeader,body: PostBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode==200 && resultBody['status']=='success') {
    
    SuccessToast("Request Success");
    print("status code is $resultCode");
    await writeUserData(resultBody);
    return true;
  } 
  else {
    ErrorToast("Request fail try again");
      return false;
  }

}


Future<bool>registration(FormValues)async{
  var Url = Uri.parse("${baseUrl}/registration");
  var PostBody = json.encode(FormValues);

  var response = await http.post(Url,headers: requestHeader,body: PostBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode==200 && resultBody["status"]=="success") {

    SuccessToast("Request Success");
    await writeUserData(resultBody);
    return true;
  } else {
    ErrorToast("Request fail try again");
  }
  return false;
}






Future<bool>email_verification(email)async{
  var Url = Uri.parse("${baseUrl}/RecoverVerifyEmail/${email}");

  var response = await http.get(Url,headers: requestHeader);


  var resultCode =response.statusCode;

  var resultBody = json.decode(response.body);

  if (resultCode==200 && resultBody["status"]=="success") {
    SuccessToast("Request Success");
  } else {
    ErrorToast("Request fail try again");

  }
  return false;
}



Future<bool>verifyOtp(email,Otp)async{
  var Url = Uri.parse("${baseUrl}/RecoverVerifyOTP/${email}/${Otp}");

  var response = await http.get(Url,headers: requestHeader);


  var resultCode =response.statusCode;

  var resultBody = json.decode(response.body);

  if (resultCode==200 && resultBody["status"]=="success") {
    SuccessToast("Request Success");
  } else {
    ErrorToast("Request fail try again");

  }
  return false;
}

Future<bool>setNewPassword(FormValues)async{
  var Url = Uri.parse("${baseUrl}/RecoverResetPass");
  var PostBody = json.encode(FormValues);

  var response = await http.post(Url,headers: requestHeader,body: PostBody);
  var resultCode = response.statusCode;
  var resultBody = json.decode(response.body);

  if (resultCode==200 && resultBody["status"]=="success") {
    SuccessToast("Request Success");
    
  } else {
    ErrorToast("Request fail try again");
  }
  return false;
}