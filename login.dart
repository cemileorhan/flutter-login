import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
@override
Widget build(BuildContext context) {
return MaterialApp(
debugShowCheckedModeBanner: false,
home: Scaffold(
appBar: AppBar(
title: Text("Text App"),
),
body: TextSample(),
),
);
}
}
class TextSample extends StatefulWidget {
@override
_TextSample createState() => _TextSample();
}
class _TextSample extends State<TextSample> {
final _formkey=GlobalKey<FormState>();
String? email,password,valemail,valpassword;
bool passenable=true;

@override
Widget build(BuildContext context) {
return SingleChildScrollView(
child: Form(
key: _formkey,
child: Column(
children: [
Padding(padding: EdgeInsets.all(15),
child: TextFormField(
keyboardType: TextInputType.emailAddress, //email zorunlulugu
decoration: InputDecoration(
hintText: "Enter your email",
labelText: "email",
prefixIcon: Icon(Icons.mail),
border: OutlineInputBorder(),
),
validator: (val){ //val, girdigim bilgi. val yerine asude de olur
if(val!.isEmpty) return "Email field cannot be left blank";
else if(!val.contains("@")) return "Email is not validated";
return null;

},
onSaved: (val){email=val;}, //bu, butona yansiyacak
),
),
Padding(padding: EdgeInsets.all(15),
child: TextFormField(
obscureText: passenable,
keyboardType: TextInputType.emailAddress,
decoration: InputDecoration(
hintText: "Enter your password",
labelText: "password",
prefixIcon: Icon(Icons.lock),
border: OutlineInputBorder(),
suffix: IconButton(
onPressed: (){
setState(() {
if(passenable) passenable=false; else passenable=true;
});
},
icon: Icon(passenable==true?Icons.remove_red_eye:Icons.password),
),
),
validator: (val){ //val, girdigim bilgi. val yerine asude de olur
if(val!.isEmpty) return "Password field cannot be left blank";
else if(val.trim().length<6) return "Password length is invalid";
return null;

},
onSaved: (val){password=val;}, //bu, butona yansiyacak
),
),
SizedBox(height: 20,),
ElevatedButton(
child: Text("Post"),
onPressed: (){
if(_formkey.currentState!.validate())
{
_formkey.currentState!.save();
setState(() {
valemail="Welcome"+" " +email!;
valpassword=password;
});
}
},

),
SizedBox(height: 20,),
Text("${valemail}"),
],

),
),
);
}
}