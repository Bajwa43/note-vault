import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HelperFirebase {
  static var categroyTypeFirestoreInstance =
      FirebaseFirestore.instance.collection('CategoryType');
  static var storageInstance = FirebaseStorage.instance;
}
