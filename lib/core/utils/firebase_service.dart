import 'dart:html';

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

  Future<void> login({required String password, required String email}) async {
    await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> storeData(
      {required String Collection,
      required body,
      required String email}) async {
    await firestore.collection(Collection).add(body);
  }

  Future<DocumentSnapshot> readDocument(
      {required String Collection, required documentId}) async {
    DocumentSnapshot data =
        await firestore.collection(Collection).doc(documentId).get();

    return data;
  }

  Future<void> update(
      {required String Collection, required body, required documentId}) async {
    await firestore.collection(Collection).doc(documentId).update(body);
  }
}
