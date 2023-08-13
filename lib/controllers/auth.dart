import 'dart:developer' show log;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers.dart';

class AuthControllers {
  final Ref ref;
  // final FirebaseAuth firebaseAuth;
  // final FirebaseFirestore firestore;
  const AuthControllers(
        this.ref
      );

  Future<void> register(
      {required String email,
      required String password,
      required String username}) async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final user = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user.user != null) {
        user.user!.updateDisplayName(username);
      }
      log("${user.user?.uid}\n${user.user?.displayName}");
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      final user = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      log('${user.user?.uid}');
    } on FirebaseAuthException catch (e) {
      log(e.toString());
    }
  }

  // void tryVerifyAndUpdatePhoneNumber(String phoneNumber) async {
  //     final firebaseAuth = ref.read(firebaseAuthProvider);
  //   await firebaseAuth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     verificationCompleted: (credential) async {
  //       await firebaseAuth.currentUser!.updatePhoneNumber(credential);
  //     },
  //     verificationFailed: (err) {},
  //     codeSent: (codeSent, [_]) {},
  //     codeAutoRetrievalTimeout: (retry) {},
  //   );
  // }

  Future<void> logout() async {
    try {
      final firebaseAuth = ref.read(firebaseAuthProvider);
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
    }
  }
}


