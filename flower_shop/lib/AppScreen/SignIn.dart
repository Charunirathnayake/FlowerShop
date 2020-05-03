import 'package:flower_shop/AppScreen/SignUp.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return SigninState();
  }

}

class SigninState extends State<Signin>{
TextEditingController emailcontroller=TextEditingController();
TextEditingController passcontroller=TextEditingController();

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
child: Center(
  child:Container(
    color: Color(0xffF59FF0).withOpacity(0.5),
                width: 280.0,
                height: 400.0,
                child: Form(child: ListView(
                  children: <Widget>[
                    Column(
                     children: <Widget>[
                       Text(
                            'Join with Florist',
                            style: TextStyle(
                              color: Color(0xff87057F),
                                fontSize: 25.0, fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'SignIn',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold),
                          ),

                           SizedBox(height: 20.0,),
                           Container(
                             decoration: BoxDecoration(
                               color:Colors.white,
                               borderRadius: BorderRadius.circular(10)
                             ),
              height: 40.0,
              width: 250.0,
              child: TextFormField(
                validator: validateEmail,
                controller: emailcontroller,
                decoration: InputDecoration(
                    errorStyle:
                        TextStyle(color: Color(0xff87057F), fontSize: 15.0),
                    prefixIcon: Icon(Icons.email),
                    labelText: 'E-mail',
                    hintText: 'nikeshi@gmail.com',
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            SizedBox(
              height:10.0
            ),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white
              ),
              height: 40.0,
              width: 250.0,
              child: TextFormField(
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Enter Your Password';
                  } else {
                    return null;
                  }
                },
                controller: passcontroller,
                obscureText: _isHiddenPw,
                decoration: InputDecoration(
                    errorStyle:
                        TextStyle(color: Color(0xff87057F), fontSize: 15.0),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: _visiblePw,
                      icon: _isHiddenPw
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                    labelText: 'Password',
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 15.0, color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            SizedBox(
              height:20.0
            ),

            Container(
              height: 35.0,
              width: 170.0,
              child: Padding(
                padding: const EdgeInsets.only(top:5.0,bottom:5.0),
                child: RaisedButton(
                    color: Color(0xff87057F),
                    
                    
                    hoverColor: Color(0xffF5CA99),
                    onPressed: () async {
                       },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      side: BorderSide(color: Color(0xff87057F)),
                    ),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    )),
              ),
            ),

            SizedBox(
height: 10.0,
            ),

            Container(
              child: GestureDetector(
                child: Text(
                  'No Account yet?SignUp here',
                  style: TextStyle(
                     // decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.solid,
                      fontSize: 15.0,
                      color: Color(0xff87057F),
                      fontWeight: FontWeight.bold,
                      decorationThickness: 1.5),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (SignUp()),
                      ));
                },
              ),
            ),
                    

          SizedBox(
            height: 10.0,
          ),
          Container(
              child: GestureDetector(
                child: Text(
                  'I forget my password',
                  style: TextStyle(
                      decorationStyle: TextDecorationStyle.solid,
                      fontSize: 15.0,
                      color: Color(0xff87057F),
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  
                 
                },
              ),
            ),


                          
                     ], 
                    )
                  ],
                )),
                
  )
),

          )
        ],
      ),
    )
     ;
  }

}
String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Enter Valid Email';
  }
  if (value.isEmpty) {
    return 'Enter your E mail';
  }
  return null;
}
