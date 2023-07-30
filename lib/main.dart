import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rabbil/utils/utility/utility.dart';


import 'controller/auth_controller.dart';
import 'screen/onboarding/login_screen.dart';



void main()async {
WidgetsFlutterBinding.ensureInitialized();
 String? token= await readUserData('token');

if (token==null) {
  runApp( MyApp('/login'));
}else{
runApp( MyApp('/newTaksList'));
}


  
}

class MyApp extends StatelessWidget {
  final String firstRoute;
   MyApp(this.firstRoute);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
         ChangeNotifierProvider<AuthController>(
      create: (BuildContext context){
        return AuthController(
          
        );
      }
         ),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task manager',
        theme: ThemeData(
          scaffoldBackgroundColor:Color(0xffC4C4C4),
          
          primarySwatch: Colors.blue,
        ),
        home:LoginScreen(),
      ),
    );
  }
}

