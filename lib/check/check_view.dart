
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/auth_controller.dart';
import '../screen/onboarding/login_screen.dart';
import '../utils/utility/utility.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
@override
  void initState() {

    readProfileData();
    super.initState();
  }


  Map<String,String>getData={"email":"","firstName":"","lastName":"","mobile":"","password":""};

readProfileData()async{
  String? email = await readUserData("email");
  String? firstName = await readUserData("firstName");
  String? lastName = await readUserData("lastName");
  String? mobile = await readUserData("mobile");
  String? password = await readUserData("password");
  setState(() {
    getData={"email":"$email","firstName":"$firstName","lastName":"$lastName","mobile":"$mobile","password":"$password"};
  });
}

 



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NewTaskList"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${getData["email"]}"),
            SizedBox(height: 50,),
            Text("${getData["mobile"]}"),
            SizedBox(height: 50,),
            Text("${getData["password"]}"),
            SizedBox(height: 50,),
            Text("${getData["firstName"]}"),
            SizedBox(height: 50,),
            Text("${getData["lastName"]}"),

            Consumer<AuthController>(
              builder: ((context, value, child) {
                return ElevatedButton(
              onPressed: (){
                value.logOut();
                 Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>LoginScreen()), (route) => false);
              }, 
              child: Text("LogOut")
              );
              }),
              
            )
          ],
        ),
      ),
    );
  }
}


