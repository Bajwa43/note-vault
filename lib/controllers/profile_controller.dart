import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:todo_app/models/user_model.dart/user_model.dart';

import '../data/helpers/firebase_helper/firebase_helper.dart';

class ProfileController extends GetxController {
  UserModel? userModel;
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
    userModel = UserModel.fromMap(data.data() as Map<String, dynamic>);
  }
}
