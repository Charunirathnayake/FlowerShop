import 'package:flower_shop/AppScreen/SignUp.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyHomePage());


class MyHomePage extends StatefulWidget {
 
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   @override
  Widget build(BuildContext context) {
return MaterialApp(
  theme: ThemeData(
 primarySwatch: Colors.brown
      ),
      debugShowCheckedModeBanner: false,
      home: SignUp(),
   
) ; 
 
}
}