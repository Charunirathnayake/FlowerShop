import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return ProfileState();
  }

    }

class ProfileState extends State<Profile>{
  File _image;
  String name,description,email,location,number,address;
  String url;

  getName(name) {
    this.name = name;
  }
  getDescription(description) {
    this.description = description;
  }
getlocation(location) {
    this.location = location;
  }
  getNumber(number) {
    this.number = number;
  }
  getEmail(email) {
    this.email = email;
  }
  getAddress(address){
    this.address=address;
  }

  createData() async {
    FirebaseUser user=await FirebaseAuth.instance.currentUser();
                String id=user.uid.toString();

   
    DocumentReference ds =
        Firestore.instance.collection('profiledata').document(id);
        //String uid=ds.documentID.toString();

        
    Map<String, dynamic> tasks = {
      "id":id,
      "name": name,
      "description": description,
      "address": address,
      "location": location,
      "phonenumber": number,
      "email": email,
      
       };
    ds.setData(tasks).whenComplete(() {
      print('New data added.');
    });
  }


Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      print('Image path $_image');
    });
  }
Future uploadpic(BuildContext context) async {
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child("fileName");
    var timeKey = DateTime.now();

    final StorageUploadTask uploadTask =
        firebaseStorageRef.child(timeKey.toString() + ".jpg").putFile(_image);

    var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    url = imageUrl.toString();
    print("Image Url=" + url);
    //saveToDatabase(url);

    setState(() {
      print('Profile picture is uploaded.');
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Profile picture is uploaded.'),
      ));
    });
  }

Future<void> saveToDatabase(url) async {
   FirebaseUser user=await FirebaseAuth.instance.currentUser();
                String id=user.uid.toString();


    DocumentReference ds =
        Firestore.instance.collection('profiledata').document(id);
        //String uid=ds.documentID.toString();

    Map<String, dynamic> tasks = {
  
      
      "id":id,
      "name": name,
      "description": description,
      "address": address,
      "location": location,
      "phonenumber": number,
      "email": email,
      
      "Image": url,
    };
    ds.setData(tasks).whenComplete(() {
      print('New data added.');
    });
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      drawer:Drawer(
      
        elevation:10.0,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Color(0xff87057f), Color(0xff931E8B),Color(0xff9F3798)])),
              child: Container(
                  child: Column(
                children: <Widget>[
                  Material(
                      elevation: 10.0,
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      
                        child:CircleAvatar(
                          maxRadius: 40.0,
                          backgroundImage: AssetImage('images/signup.login.jpg'),
                        ),
                      
                      ),
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text('Florist',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Pacifico',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              )),
            ),
            CustomListTile1(),
            CustomListTile2(),
            CustomListTile3(),
                      ],
        ),
      ),
    
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
            SizedBox(
              height: 20.0,
            ),
  Padding(
    padding: const EdgeInsets.only(top:30.0,bottom: 30.0,left:30.0),
    child: Row(
      children: <Widget>[
        Flexible(
                  child: Text('Create Florist Account',style: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),),
        ),
      

    


       
        
      ],
    ),
  ),


            Expanded(child: Container(
              child:ListView(
                children: <Widget>[
 Column(
                  children: <Widget>[
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,  
                      children: <Widget>[
                        CircleAvatar(
                        //backgroundColor: Color(0xffBA680B),
                  backgroundImage: AssetImage('images/signup.login.jpg'),
                        radius: 100,
                        child: ClipOval(
                          child: SizedBox(
                            width: 180.0,
                            height: 180.0,
                            child: (_image != null)
                                ? Image.file(
                                    _image,
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(
                                    'images/signup.login.jpg',
                                    fit: BoxFit.fill,
                                  ),
                          ),
                        ),
                  ),

                  Padding(
                padding: EdgeInsets.only(top: 60.0),
                child: IconButton(
                  color: Color(0xff87057F),
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {
                    getImage();
                  },
                  iconSize: 30.0,
                ),
              )

                      ],
                    ),
                    SizedBox(
              height: 20.0,
            ),

            Column(
            children: <Widget>[
              Text(
                'Shop Name/Company Name',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,color: Color(0xff87057F)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  height: 50.0,
                  child: TextFormField(
                    onChanged: (String name) {
                      getName(name);
                    },
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10.0,),
Column(
            children: <Widget>[
              Text(
                'Description of your service',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,
                color: Color(0xff87057F)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  height: 50.0,
                  child: TextFormField(
                    onChanged: (String description) {
                      getDescription(description);
                    },
                  ),
                ),
              )
            ],
          ),
 SizedBox(height: 10.0,),
          Column(
            children: <Widget>[
              Text(
                'Location',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,color: Color(0xff87057F)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  height: 50.0,
                  child: TextFormField(
                    onChanged: (String location) {
                      getlocation(location);
                    },
                  ),
                ),
              )
            ],
          ),
SizedBox(height: 10.0,),
          Column(
            children: <Widget>[
              Text(
                'Address',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,color: Color(0xff87057F)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  height: 50.0,
                  child: TextFormField(
                    onChanged: (String address) {
                      getAddress(address);
                    },
                  ),
                ),
              )
            ],
          ),
 

 SizedBox(height: 10.0,),
          Column(
            children: <Widget>[
              Text(
                'Contact Number',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,color: Color(0xff87057F)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  height: 50.0,
                  child: TextFormField(
                    onChanged: (String number) {
                      getNumber(number);
                    },
                  ),
                ),
              )
            ],
          ),
 SizedBox(height: 10.0,),
           Column(
            children: <Widget>[
              Text(
                'E-mail',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold,color: Color(0xff87057F)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Container(
                  height: 50.0,
                  child: TextFormField(
                    onChanged: (String email) {
                     getEmail(email);
                    },
                  ),
                ),
              )
            ],
          ),





                  
                  ],

                  
                ),

                ],
                              
              ),
               decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
               
            )
            )
            
          ],
        ),
      ),
    );
  }

}

class CustomListTile1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: InkWell(
          splashColor: Color(0xff931E8B),
          onTap: () {},
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.person),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Profile',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class CustomListTile2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: InkWell(
          splashColor: Color(0xff931E8B),
          onTap: () {},
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.person),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Profile',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class CustomListTile3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: InkWell(
          splashColor: Color(0xff931E8B),
          onTap: () {},
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.person),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Profile',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
