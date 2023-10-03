import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rabbil/controller/auth_controller.dart';
import 'package:rabbil/screen/onboarding/login_screen.dart';
import '../../models/sign_up_model.dart';
import '../../style/style.dart';
import '../../utils/widgets/text_field/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var firstNameController = TextEditingController();
    var lasttNameController = TextEditingController();
    var mobileController = TextEditingController();












    
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp Screen"),
      ),
      body: Consumer<AuthController>(
        builder: (context, pro, child) {
          return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: paddingX),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text(
                "Join With Us",
                style: Head1Text(colorDarkBlue),
                ),
                SizedBox(height: 1,),
                 Text(
                "Learn With Rabbil Hasan",
                style: Head6Text(colorLightGray),
                ),
               
                SizedBox(height: 20,),
                  CustomTextField(
                  controller: emailController,
                  name: "Email",
                    ),
                SizedBox(height: 20,),
                CustomTextField(
                  controller: firstNameController,
                  name: "FirstName",
                    ),
                SizedBox(height: 20,),
                CustomTextField(
                  controller: lasttNameController,
                  name: "LastName",
                    ),
                SizedBox(height: 20,),
                CustomTextField(
                  controller: mobileController,
                  name: "Mobile",
                    ),
                
                SizedBox(height: 20,),
                CustomTextField(
                  controller: passwordController,
                  name: "Password",
                    ),
                SizedBox(height: 20,),
                // TextFormField(
                //   decoration: AppInputDecoration("Confirm Password"),
                // ),
                SizedBox(height: 20,),
                ElevatedButton(
                      style: AppButtonStyle(
                        
                      ),
                    onPressed: ()async{
                      if (emailController.text.isEmpty) {
                     Fluttertoast.showToast(msg: "Enter your email");
                        } else if (passwordController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter your password");
                        }else if (passwordController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter your password");
                        }else if (firstNameController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter your FirstName");
                        }else if (lasttNameController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter your LastName");
                        }else if (mobileController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Enter your Mobile Number");
                        }
                        else {
                      SignUpBody signUpBody= SignUpBody( 
                      email: emailController.text, 
                      password: passwordController.text,
                      firstName: firstNameController.text,
                      lastName: lasttNameController.text,
                      mobile: mobileController.text
                      );
                      pro.cReg(signUpBody).then((status) {
                        if (status.isSuccess) {
                         Fluttertoast.showToast(msg: "All went well",);
                        print("Success Login");
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                        
                      } else {
                        Fluttertoast.showToast(msg: "Something Wrong",);
                        print("object");
                      }
                      });
                        }
                        },
                    child: SuccessButtonChild("Submit",)
                    ),
                    Row(
                    children: [
                      Text("Have an account?"),
                      TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                        }, 
                        child: Text("Login")
                        )
                    ],
                  )
            
                ],
              ),
            ),
          ),
        );
        },
        
      ),
    );
  }
}

