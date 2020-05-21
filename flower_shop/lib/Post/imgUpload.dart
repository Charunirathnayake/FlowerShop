import 'package:flower_shop/Post/PostUI.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:intl/intl.dart';

class Upload_img extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Upload_img_State();
  }
}

class Upload_img_State extends State<Upload_img> {
  File sampleImage;
  String Url;
  final formkey = GlobalKey<FormState>();
  String _myvalue;

  Future getImage() async {
    var tempImg = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      sampleImage = tempImg;
    });
  }

  bool validateAndsave() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Future<void> UploadStatusImage() async {
    if (validateAndsave()) {
      final StorageReference PostImgRef =
          FirebaseStorage.instance.ref().child("Post Images");
      var timeKey = DateTime.now();
      final StorageUploadTask uploadTask =
          PostImgRef.child(timeKey.toString() + ".jpg").putFile(sampleImage);
      var ImageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      Url = ImageUrl.toString();
      print("Image Url=" + Url);
      saveToDatabase(Url);
      gotouploadpage();
    }
  }

  void saveToDatabase(Url) {
    var dbTimeKey = DateTime.now();
    var formatDate = DateFormat('MMM d,YYYY');
    var formatTime = DateFormat('EEEE,hh:mm aaa');

    String date = formatDate.format(dbTimeKey);
    String time = formatTime.format(dbTimeKey);
    DatabaseReference ref = FirebaseDatabase.instance.reference();
    var data = {
      
      "image": Url,
      "description": _myvalue,
      "date": date,
      "time": time
    };
    ref.child("Posts").push().set(data);
  }

  void gotouploadpage() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PostHome();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        backgroundColor: Color(0xff87057F),
        title: Text("Add Your Posts"),
        
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
                      'Add Your Posts',
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
                child: Center(
                  child: sampleImage == null
                      ? Text("Select an Image")
                      : enableUpload(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Add Image',
        child: Icon(Icons.add_a_photo),
        backgroundColor: Color(0xff87057F),
      ),
    );
  }

  Widget enableUpload() {
    return ListView(
      children: <Widget>[
        Container(
          child: Form(
            key: formkey,
            child: Column(
              children: <Widget>[
                Image.file(sampleImage, height: 300.0, width: 600.0),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    return value.isEmpty ? 'Description is required' : null;
                  },
                  onSaved: (value) {
                    return _myvalue = value;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0,right:8.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                                            child: RaisedButton(
                          onPressed: (){
                            Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>Upload_img()));
                          },
                          elevation: 10.0,
                          child: Text("Delete Post"),
                          textColor: Colors.white,
                          color: Color(0xff87057F),
                        ),
                      ),
                      SizedBox(
width:10.0 ,                    ),

                      Expanded(
                                            child: RaisedButton(
                          onPressed: UploadStatusImage,
                          elevation: 10.0,
                          child: Text("Add Post"),
                          textColor: Colors.white,
                          color: Color(0xff87057F),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
