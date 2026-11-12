// ignore_for_file: file_names, duplicate_ignore
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  Future<User?> signUpWithEmailAndPassword(String email, String password) async {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
        
      );
      User? user = userCredential.user;
      return user;
  }

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return user;
  }

  // Sign out
  Future<void> signOut() => _auth.signOut();

  // Get the current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
  Future<void> resetPassword(String email) =>
      _auth.sendPasswordResetEmail(email: email);
 
}
 

final AuthService authService = AuthService();
