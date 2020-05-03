import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    
    return HomeState();
  }

}

class HomeState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
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
      ),
      body: 
      Container(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         
          children: <Widget>[
            CarouselSlider(
              height: 400,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              items: <Widget>[
              GestureDetector(child: Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('images/flowershop.jpg'),
                   Text (
                          'Search Florist',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.center,
                        )
                  ],
                ),
              ),)
            ],
              
            )
          ],
        )
      ),
    );
  }

}