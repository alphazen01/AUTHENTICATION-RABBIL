

class SignUpBody{
String firstName;
String lastName;
String mobile;
String email;
String password;

SignUpBody({
  required this.firstName,
  required this.lastName,
  required this.mobile,
  required this.email,
  required this.password,
});


Map<String, dynamic>toJson(){
  final Map<String,dynamic>data = Map<String,dynamic>();
  data["firstName"] = this.firstName;
  data["lastName"] = this.lastName;
  data["mobile"] = this.mobile;
  data["email"] = this.email;
  data["password"] = this.password;
  return data;
}






}