import 'package:firebase_auth/firebase_auth.dart';
 class Auth{
  final _firebaseAuth=FirebaseAuth.instance;
  Future<bool> signInWithEmail(String email, String password) async {
    try {
      AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      if (user != null) {
        
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
Future<void> logout () async{
try{
await _firebaseAuth.signOut();
}
catch(e){
print("Error Logging Out");
}
}
  }