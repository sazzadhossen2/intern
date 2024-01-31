import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
///instace of fireStore
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;
  ///Sign user in
  Future<UserCredential> signWithEmailPassword(String email,
      String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      ///after creating the user creat a new document
      _firestore.collection('user').doc(userCredential.user!.uid).set({
        'uid':userCredential.user!.uid,
        'email':email
      },SetOptions(merge:true));

      return userCredential;
    }
    on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  ///create a new error
  Future<UserCredential> signupEmailandPassword(String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email,
          password: password);

      ///after creating the user creat a new document
      _firestore.collection('user').doc(userCredential.user!.uid).set({
        'uid':userCredential.user!.uid,
        'email':email
      });
      return userCredential;
    }on FirebaseAuthException catch(e){
      throw Exception(e.code);
    }
  }


  ///signOut
  Future<void> SignOut() async {
    return await FirebaseAuth.instance.signOut();
  }


}