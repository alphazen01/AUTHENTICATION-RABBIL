
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rabbil/screen/onboarding/registaraion_screen.dart';
import '../../check/check_view.dart';
import '../../controller/auth_controller.dart';
import '../../models/login_model.dart';
import '../../style/style.dart';
import '../../utils/widgets/text_field/custom_textfield.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

  



    return Scaffold(
      appBar: AppBar(
        title: Text("Log in Screen"),
      ),
      body: Consumer<AuthController>(
        builder: (context, pro, child) {
          return pro.isLoading?Center(
            child: CircularProgressIndicator(
              color: Colors.redAccent,
             ),
          ): Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: paddingX),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                  "Get Started With",
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
                    controller: passwordController,
                    name: "Password",
                      ),

                    SizedBox(height: 20,),
                   
                    ElevatedButton(
                    style: AppButtonStyle(
                      
                    ),
                  onPressed: ()async{
                    if (emailController.text.isEmpty) {
                   Fluttertoast.showToast(msg: "Enter your email");
                      } else if (passwordController.text.isEmpty) {
                      Fluttertoast.showToast(msg: "Enter your password");
                      }
                      else {
                    LoginModel loginModel= LoginModel( 
                    email: emailController.text, 
                    password: passwordController.text
                    );
                    pro.cLog(loginModel).then((status) {
                      if (status.isSuccess) {
                       Fluttertoast.showToast(msg: "All went well",);
                      print("Success Login");
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
                      
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
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>SignUpScreen()));
                        }, 
                        child: Text("Sign Up")
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