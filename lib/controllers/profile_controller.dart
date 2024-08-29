import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/models/user_model.dart/user_model.dart';

import '../data/helpers/firebase_helper/firebase_helper.dart';
import '../data/helpers/helper_functions.dart';

class ProfileController extends GetxController {
  Rx<UserModel?> userModel = UserModel(userName: 'Name', imagePath: '').obs;
  @override
  void onInit() {
    getUserDate();
    super.onInit();
  }

  getUserDate() async {
    //  var data =
    DocumentSnapshot<Map<String, dynamic>> data = await HelperFirebase
        .userInstance
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    userModel.value = UserModel.fromMap(data.data() as Map<String, dynamic>);
  }

  editName(TextEditingController nameControler, BuildContext context) async {
    try {
      HelperFunctions.showBottomSheet(context);

      await HelperFirebase.userInstance
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'userName': nameControler.text}).then(
              (value) => HelperFunctions.showToast('Name is Updated!'));

      Get.back();
      Get.back();
    } catch (e) {
      HelperFunctions.showToast(e.toString());
    }
  }

  pickImage(
      {required ImageSource source, required BuildContext context}) async {
    ImagePicker picker = ImagePicker();
    XFile? pickedFile = await picker.pickImage(source: source);
    // File(file!.path);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      Reference ref = FirebaseStorage.instance.ref('users').child(
          'profile_images/${FirebaseAuth.instance.currentUser!.uid}.jpg');

      try {
        HelperFunctions.showBottomSheet(context);

        TaskSnapshot snapshot = await ref.putFile(file);
        String url = await snapshot.ref.getDownloadURL();

        HelperFirebase.userInstance
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({'imagePath': url});

        //  upload.
        Get.back();
        Get.back();
        // HelperFunctions.showToast('Image Selected: $url');
      } catch (e) {
        HelperFunctions.showToast('Error In Uploading : $e');
      }
    } else {
      HelperFunctions.showToast('Image Not Sellected! Try Again');
    }
  }
}
