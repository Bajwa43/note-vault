import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HelperFirebase {
  static var categroyTypeFirestoreInstance =
      FirebaseFirestore.instance.collection('CategoryType');
  static var storageInstance = FirebaseStorage.instance;

  static var tasksFirestoreInstance =
      FirebaseFirestore.instance.collection('Tasks');

  // static

  static var userInstance = FirebaseFirestore.instance.collection('Users');

  user({required String userId}) {
    return FirebaseFirestore.instance
        .collection('user')
        .doc()
        .collection(userId)
        .doc()
        .collection('tasks');
  }
}
