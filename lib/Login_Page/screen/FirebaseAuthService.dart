import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> signUpWithEmailAndPassword(String email, String password, String username) async {
    try {
      // Create user with email and password using Firebase Authentication
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Store username in Cloud Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': username,
        'email': email,
        // Add other user details as needed
      });

      return userCredential;
    } catch (e) {
      // Handle signup errors here
      print('Error during signup: $e');
      throw e;
    }
  }
}

