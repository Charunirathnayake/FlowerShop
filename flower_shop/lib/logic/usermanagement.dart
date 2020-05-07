import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserManagement{
  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser() != null) {
      
      return true;
    } else {
      return false;
    }
  }


  Future<void> addData(userData) async{
    
  

      

    //FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
        FirebaseUser user=await FirebaseAuth.instance.currentUser();
                String uid=user.uid.toString();

    if(isLoggedIn()){

      Firestore.instance.collection('User').document(uid).setData(userData)
      
            
            .
      catchError((e){
        print(e); });

    

    }else{
      print('You Need to log in');
    }
  }}