import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_shop/AppScreen/Fields.dart';
import 'package:flower_shop/AppScreen/MainBody.dart';
import 'package:flower_shop/AppScreen/SignIn.dart';
import 'package:flower_shop/AppScreen/SignUp.dart';
import 'package:flower_shop/AppScreen/profile.dart';
import 'package:flower_shop/Post/PostUI.dart';
import 'package:flower_shop/Post/imgUpload.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyHomePage());


class MyHomePage extends StatefulWidget {
 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
bool isloggin=false;

@override
void initState(){
  super.initState();
  FirebaseAuth.instance.currentUser().then((currentUser)=>{
    isloggin=true
});
  
}


   @override
  Widget build(BuildContext context) {
return MaterialApp(
  theme: ThemeData(
 primarySwatch: Colors.purple
      ),
      debugShowCheckedModeBanner: false,
      home: /*isloggin?Home():Signin(),*/ Fields()
   
) ; 
 
}
}