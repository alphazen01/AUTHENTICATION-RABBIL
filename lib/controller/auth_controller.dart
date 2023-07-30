import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:rabbil/models/sign_up_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../models/login_model.dart';
import '../models/respones_model.dart';
import '../utils/utility/utility.dart';





class AuthController extends ChangeNotifier{
  // final SharedPreferences sharedPreferences;

bool _isLoading = false;

bool get isLoading => _isLoading;





Future<ResponseModel> cReg(SignUpBody signUpBody)async{
_isLoading = true;
notifyListeners();

var response = await http.post(
  Uri.parse("https://task.teamrabbil.com/api/v1/registration"),
  body: jsonEncode(signUpBody),
  headers: <String,String>{
    'Content-Type': 'application/json; charset=UTF-8',
    // 'Authorization': 'Bearer $token'
  }
);
 print({"response.statusCode:${response.statusCode}"});
 late ResponseModel responseModel;
 var resultBody= json.decode(response.body);
 if (response.statusCode==200) {
  // await writeUserData(resultBody);
  responseModel = ResponseModel(true, response.body);
    jsonDecode(response.body);
    print(response.statusCode);
 } else {

    responseModel = ResponseModel(false,response.body);
 }
 _isLoading = false;
notifyListeners();
 return responseModel;
}



Future<ResponseModel> cLog(LoginModel checkLogin)async{
_isLoading = true;
notifyListeners();

var response = await http.post(
  Uri.parse("https://task.teamrabbil.com/api/v1/login"),
  body: jsonEncode(checkLogin),
  headers: <String,String>{
    'Content-Type': 'application/json; charset=UTF-8',
  }
);
 print({"response.statusCode:${response.statusCode}"});
 late ResponseModel responseModel;
 var resultBody= json.decode(response.body);
 if (response.statusCode==200) {
await writeUserData(resultBody);
  // await writeUserData();
  responseModel = ResponseModel(true, response.body);
    
  jsonDecode(response.body);
    print(response.statusCode);
    print(response.body);
 } else {

    responseModel = ResponseModel(false,response.body);
 }
 _isLoading = false;
notifyListeners();
 return responseModel;
}



 Future logOut ()async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove("email");
        prefs.remove("token");
        print("object") ;
      }




}

