import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flower_shop/AppScreen/SignIn.dart';
import 'package:flower_shop/logic/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {

/*@override
  void initState() {
    // print(uId + '   $userName');
    super.initState();
    FirebaseAuth.instance.currentUser().then((currentUser) => {
          if (currentUser == null)
            {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) =>Signin()),
                (Route<dynamic> route) => false,
              )
            }
          else
            
            print(currentUser.displayName)
        });
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        backgroundColor: Color(0xff87057F),
        title: Text('Florist',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,fontStyle:FontStyle.italic),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            tooltip: "Logout",
            onPressed: () async {
              
            },
          ),
        ],
      ),*/
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color(0xff87057f),
          Color(0xff931E8B),
          Color(0xff9F3798),
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 5.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Florist',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Colors.white),
                      ),

                      IconButton(icon:Icon(Icons.track_changes), onPressed: (){
                        Auth().logout();
                      })
                    ],
                  ),

                  Text('Make Your Choise in flower world',textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Italianno',
                                              fontSize: 28.0,
                                              color: Colors.white
                                              
                                            ),),
                                          
                    
                   CircleAvatar(
                     maxRadius: 40.0,
                    //  backgroundColor: Color(0xff931E8B),
                      backgroundImage: AssetImage('images/signup.login.jpg')
                    ),
                  
                   SizedBox(
                                              height: 1.0,
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
                child: CarouselSlider(
                  height: 300,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  items: <Widget>[
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('images/signup.login.jpg'),
                                      fit: BoxFit.cover)),
                              child: Center(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.search,
                                        size: 150.0,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Search your Florist',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:
                                          Color(0xff87057F).withOpacity(0.5)),
                                  width: 200,
                                  height: 300,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('images/signup.login.jpg'),
                                      fit: BoxFit.cover)),
                              child: Center(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.person,
                                        size: 150.0,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: 
                                          
                                            Text(
                                              'As a Florist',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 30.0,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                           
                                        
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:
                                          Color(0xff87057F).withOpacity(0.5)),
                                  width: 200,
                                  height: 300,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('images/signup.login.jpg'),
                                      fit: BoxFit.cover)),
                              child: Center(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.wallpaper,
                                        size: 130.0,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Your Wall',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color:
                                          Color(0xff87057F).withOpacity(0.5)),
                                  width: 200,
                                  height: 300,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

//secondone


          ],
        ),
      ),
    );
  }
}
