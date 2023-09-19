import 'package:firebase_auth/firebase_auth.dart';


class Auth{
  final FirebaseAuth _firebaseAuth =FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;

  Stream <User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signwithEmailandPass({required String email, required String password})async{
 
 await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
}



Future<void> CreateAccountWithEmailAndPassword({required String Email, required String Password})async{
await _firebaseAuth.createUserWithEmailAndPassword(email: Email, password: Password);

}
}