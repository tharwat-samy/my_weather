import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> register(
      {required String userName,
      required String password,
      required String email}) async {
    await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> updatePassword({
    required String password,
  }) async {
    await firebaseAuth.currentUser?.updatePassword(password);
  }

  Future<void> updateEmail({
    required String email,
  }) async {
    await firebaseAuth.currentUser?.updateEmail(email);
  }

  Future<void> updateUserNmae({
    required String name,
  }) async {
    await firebaseAuth.currentUser?.updateDisplayName(name);
  }

  Future<void> login({required String password, required String email}) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> update(
      {required String Collection, required body, required documentId}) async {
    await firestore.collection(Collection).doc(documentId).update(body);
  }

  User getUser() {
    return firebaseAuth.currentUser!;
  }
}
