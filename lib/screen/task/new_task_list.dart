


import 'package:flutter/material.dart';


import '../../utils/utility/utility.dart';


class NewTaskList extends StatefulWidget {
  const NewTaskList({Key? key}) : super(key: key);

  @override
  State<NewTaskList> createState() => _NewTaskListState();
}

class _NewTaskListState extends State<NewTaskList> {
//For read data testing perpose//


String email="";
@override
  void initState() {

    readProfileData();
    super.initState();
  }
  callUserData()async{
  String? a= await readUserData("email");
   setState(() {
     email =a!;
   });
  }

  Map<String,String>getData={"email":"","firstName":"","lastName":"","mobile":""};

readProfileData()async{
  String? email = await readUserData("email");
  String? firstName = await readUserData("firstName");
  String? lastName = await readUserData("lastName");
  String? mobile = await readUserData("mobile");
  setState(() {
    getData={"email":"$email","firstName":"$firstName","lastName":"$lastName","mobile":"$mobile"};
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
            SizedBox(height: 100,),
            Text("${getData["firstName"]}"),
            SizedBox(height: 100,),
            Text("${getData["mobile"]}"),
          ],
        ),
      ),
    );
  }
}


//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text("NewTaskList")),
//     );
//   }
// }