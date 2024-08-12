import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo_app/models/HomeTaskModel/home_task_Model.dart';
import 'package:todo_app/utiles/Constants/colors.dart';

class TaskController extends GetxController {
  RxInt id = 0.obs;
  var createdAt = DateTime.now().obs;
  var updateAt = DateTime.now().obs;
  RxString titile = ''.obs;
  RxString description = ''.obs;
  var dateTime = DateTime.now().obs;
  RxInt iconCodePoint = 0.obs;
  RxString iconFontFamilty = ''.obs;
  RxInt iconColorA = 0.obs;
  RxInt iconColorR = 0.obs;
  RxInt iconColorG = 0.obs;
  RxInt iconColorB = 0.obs;
  RxInt priorityLevel = 1.obs;

  // Category
  RxInt checkCategoryIndex = 0.obs;

  // Priority
  RxInt checkPriorityIndex = 0.obs;
  RxBool check = false.obs;

  addNewTask(HomeTaskModel model) {
    FirebaseFirestore.instance.collection('Tasks').doc().set(model.toMap());
    update();

    Get.back();
  }
}
