import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_shop/data/Repository/user_repository.dart';

class FirebaseUserRepository extends UserRepository {
  static final FirebaseUserRepository instance = FirebaseUserRepository._();

  FirebaseUserRepository._();

  final _auth = FirebaseAuth.instance;

  @override
  forgetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  @override
  logOut() async {
    try {
      await _auth.signOut();
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  @override
  Future<bool> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      return false;
    }
  }

  @override
  Future<bool> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      return false;
    }
  }
}
