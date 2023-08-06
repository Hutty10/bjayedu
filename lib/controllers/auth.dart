import 'dart:developer' show log;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthControllers {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;
  const AuthControllers({required this.firebaseAuth, required this.firestore});

  Future<void> register(
      {required String email,
      required String password,
      required String userName}) async {
    try {
      final user = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user != null) {
        user.user!.updateDisplayName(userName);
      }
      log("${user.user?.uid}\n${user.user?.displayName}");
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      final user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      log('${user.user?.uid}');
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
    }
  }
}

final authProvider = Provider<AuthControllers>(
  (ref) => AuthControllers(
    firebaseAuth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  ),
);

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
},);
