import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth.dart';
import 'db.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final authProvider = Provider<AuthControllers>(
  (ref) => AuthControllers(ref),
);

final authStateProvider = StreamProvider<User?>(
  (ref) {
    final firebaseAuth = ref.watch(firebaseAuthProvider);
    return firebaseAuth.authStateChanges();
  },
);
final dbProvider = Provider<DBController>((ref) {
  return DBController(ref);
});

final usernameProvider = FutureProvider<String>(
  (ref) => ref.read(dbProvider).getUsername,
);
final emailProvider = FutureProvider<String>(
  (ref) => ref.read(dbProvider).getEmail,
);
