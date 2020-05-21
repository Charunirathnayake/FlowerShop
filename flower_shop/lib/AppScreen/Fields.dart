import 'package:flutter/material.dart';

class Fields extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Field_State();
  }
}

class Field_State extends State<Fields> {
  bool checkboxvalue1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color(0xff87057f),
          Color(0xff931E8B),
          Color(0xff9F3798),
        ])),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, bottom: 30.0, left: 30.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Text(
                      'Your Favorations',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  children: <Widget>[
                     Column(
                    children: <Widget>[


                    
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              maxRadius: 30.0,
                              backgroundImage: AssetImage('images/signup.login.jpg'),
                           
                            ),
                            Text("Wedding Arragements",style: TextStyle(
                              fontSize: 15.0
                            ),),
                            Checkbox(
                                value: checkboxvalue1,
                                onChanged: (bool value) {
                                  setState(() {
                                    checkboxvalue1 = value;
                                  });
                                }),
                          ],
                        ),
                        SizedBox(height: 10.0,),


                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              maxRadius: 30.0,
                              backgroundImage: AssetImage('images/signup.login.jpg'),
                           
                            ),
                            Text("Fresh flower delivary",style: TextStyle(
                              fontSize: 15.0
                            ),),
                            Checkbox(
                                value: checkboxvalue1,
                                onChanged: (bool value) {
                                  setState(() {
                                    checkboxvalue1 = value;
                                  });
                                }),
                          ],
                        ),
                        SizedBox(height: 10.0,),

                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              maxRadius: 30.0,
                              backgroundImage: AssetImage('images/signup.login.jpg'),
                           
                            ),
                            Text("Bridal Bouquets",style: TextStyle(
                              fontSize: 15.0
                            ),),
                            Checkbox(
                                value: checkboxvalue1,
                                onChanged: (bool value) {
                                  setState(() {
                                    checkboxvalue1 = value;
                                  });
                                }),
                          ],
                        ),
                        SizedBox(height: 10.0,),

                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              maxRadius: 30.0,
                              backgroundImage: AssetImage('images/signup.login.jpg'),
                           
                            ),
                            Text("Fresh Flower Garlands",style: TextStyle(
                              fontSize: 15.0
                            ),),
                            Checkbox(
                                value: checkboxvalue1,
                                onChanged: (bool value) {
                                  setState(() {
                                    checkboxvalue1 = value;
                                  });
                                }),
                          ],
                        ),
                        SizedBox(height: 10.0,),

                       Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              maxRadius: 30.0,
                              backgroundImage: AssetImage('images/signup.login.jpg'),
                           
                            ),
                            Text("flower Bunchers",style: TextStyle(
                              fontSize: 15.0
                            ),),
                            Checkbox(
                                value: checkboxvalue1,
                                onChanged: (bool value) {
                                  setState(() {
                                    checkboxvalue1 = value;
                                  });
                                }),
                          ],
                        ),
                        SizedBox(height: 10.0,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              maxRadius: 30.0,
                              backgroundImage: AssetImage('images/signup.login.jpg'),
                           
                            ),
                            Text("Flower Gifts",style: TextStyle(
                              fontSize: 15.0
                            ),),
                            Checkbox(
                                value: checkboxvalue1,
                                onChanged: (bool value) {
                                  setState(() {
                                    checkboxvalue1 = value;
                                  });
                                },)]),
                       SizedBox(height: 10.0,),

                      
                      
                    ],
                  ),
                  ],
                          
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
