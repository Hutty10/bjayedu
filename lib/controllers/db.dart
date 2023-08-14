import 'dart:developer' as console show log;

import 'package:bjayedu/controllers/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DBController {
  final Ref ref;
  const DBController(this.ref);
  Future<String> get getUsername async {
    final User? currentUser = ref.read(firebaseAuthProvider).currentUser;
    return currentUser!.displayName!;
  }

  String get getEmail {
    final User? currentUser = ref.read(firebaseAuthProvider).currentUser;
    return currentUser!.email!;
  }

  void setORUpdateProfile({String? phoneNumber, String? bio}) async {
    final User? currentUser = ref.read(firebaseAuthProvider).currentUser;
    final firestore = ref.read(firebaseFirestoreProvider);
    if (currentUser != null) {
      final String uid = currentUser.uid;
      try {
        await firestore.collection('profiles').doc(uid).update({});
      } on FirebaseException catch (e) {
        console.log('${e.message}');
      }
    }
  }
}
