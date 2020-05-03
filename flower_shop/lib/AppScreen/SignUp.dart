import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignUpState();
  }
}

class SignUpState extends State<SignUp> {
  TextEditingController userController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  bool _isHiddenPw = true;
  bool _isHiddenCPw = true;

  void _visiblePw() {
    setState(() {
      _isHiddenPw = !_isHiddenPw;
      _isHiddenCPw = _isHiddenCPw;
    });
  }

  void _visibleCPw() {
    setState(() {
      _isHiddenPw = _isHiddenPw;
      _isHiddenCPw = !_isHiddenCPw;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: 600.0,
          width: 350.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/signup.login.jpg'),
                fit: BoxFit.cover),
          ),
        
                        child:Padding(
                          padding: const EdgeInsets.only(top:20.0),
                          child: Form(
                                                    child: ListView(
                              children: <Widget>[
                                Center(
                child: Container(
                    color: Color(0xffF59FF0).withOpacity(0.5),
                    width: 280.0,
                    height: 400.0,
                    child: Column(
                      children: <Widget>[
                       /* Text(
                              "Florist",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FontStyle.italic,
                                  fontSize: 50.0),
                            ),*/

                            Text(
                              'Welcome to the Florist',
                              style: TextStyle(
                                color: Color(0xffAF0B69),
                                  fontSize: 25.0, fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'SignUp',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),

                             SizedBox(height: 10.0,),

                            //username

                            
                                       Container(
                                decoration:BoxDecoration(borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                                height: 40.0,
                                width: 250.0,
                                //color: Colors.white,
                                child: TextFormField(
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return ("Please enter user name");
                                    }
                                    return null;
                                  },
                                  controller: userController,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                      errorStyle: TextStyle(
                                          color: Color(0xffBA680B), fontSize: 15.0),
                                      labelText: 'User Name',
                                      labelStyle:
                                          TextStyle(fontSize: 15.0, color: Colors.black),
                                      hintText: 'Nipun',
                                      hintStyle:
                                          TextStyle(fontSize: 15.0, color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(color: Colors.grey))),
                                ),
                              ),
                            

                             SizedBox(height: 10.0,),

                            Container( 
                              height: 40.0,
                              width: 250.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                              ),
                              child: TextFormField(
                                // validate with email

                                controller: mailController,
                                validator: validateEmail,
                                decoration: InputDecoration(
                                  prefixIcon:Icon(Icons.email),
                                    errorStyle: TextStyle(
                                        color: Color(0xff87057F), fontSize: 15.0),
                                    labelText: 'E-mail',
                                    labelStyle:
                                        TextStyle(fontSize: 15.0, color: Colors.black),
                                    hintText: 'nipunsachintha@gmail.com',
                                    hintStyle:
                                        TextStyle(fontSize: 15.0, color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.grey))),
                              ),
                            ),

                            SizedBox(height: 10.0,),

                            Container(
                              height: 40.0,
                              width: 250.0,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                              color: Colors.white)
                              ,
                              child: TextFormField(
                                controller: passController,
                                validator: validatePassword,
                                obscureText: _isHiddenPw,
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                        color: Color(0xff87057F), fontSize: 15.0),
                                    prefixIcon: Icon(Icons.lock),
                                    suffixIcon: IconButton(
                                        onPressed: _visiblePw,
                                        icon: _isHiddenPw
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility)),
                                    labelText: 'Password',
                                    labelStyle:
                                        TextStyle(fontSize: 15.0, color: Colors.black),
                                    hintText: 'Password',
                                    hintStyle:
                                        TextStyle(fontSize: 15.0, color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(color: Colors.grey))),
                                keyboardType: TextInputType.emailAddress,
                              ),
                            ),
SizedBox(height:15.0),

Padding(
                child: Text(
                    'Accept our Terms & conitions and privacy policy.',
                    style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0)),
                padding: EdgeInsets.only(right: 25.0, left: 25.0),
              ),
SizedBox(height:15.0),


Container(
  width: 170.0,
  height: 35.0,
  child:   Padding(
  
                  padding: EdgeInsets.only(left: 0.0, right: 0.0),
  
                  child: RaisedButton(
  
                      color: Color(0xff87057F),
  
                      hoverColor: Color(0xff87057F),
  
                      onPressed: ()  {
  
                          
  
                      },
  
                      shape: RoundedRectangleBorder(
  
                          borderRadius: BorderRadius.circular(40.0),
  
                          side: BorderSide(color: Color(0xff87057F)),
  
                      ),
  
                      child: Text(
  
                          'SignUp',
  
                          style: TextStyle(color: Colors.white, fontSize: 15.0),
  
                      )),
  
                ),
),

              SizedBox(
                height: 15.0,
              ),

              Row(
                children: <Widget>[
                  SizedBox(
                    width: 25.0,
                  ),
                  Text('Already have a account?',
                      style: TextStyle(
                              decorationStyle: TextDecorationStyle.solid,
                              fontSize: 15.0,
                              color: Color(0xff87057F),
                              fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 10.0,
                  ),
                  GestureDetector(
                    child: Text(
                      'Log here',
                      style: TextStyle(
                              decorationStyle: TextDecorationStyle.solid,
                              fontSize: 15.0,
                              color: Color(0xff87057F),
                              fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      
                    
                    },
                  ),
                ],
              ),

              SizedBox(
                height: 20.0,
                width: 25.0,
              ),

              
              SizedBox(
                height: 10.0,
              )




                      ],
                    )),
              ),
            
          
                              ],
                            ),
                          ),
                        )
                        
                        
        )
      ],
    ));
  }
}

//E-mail validatio
String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Enter Valid Email';
  }
  return null;
}

String validatePassword(String value) {
  Pattern pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = new RegExp(pattern);
  print(value);
  if (value.isEmpty) {
    return 'Please enter password';
  } else {
    if (!regex.hasMatch(value))
      return 'Enter valid password';
    else
      return null;
  }
}
