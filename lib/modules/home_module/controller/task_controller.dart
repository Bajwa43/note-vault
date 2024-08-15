import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:todo_app/utiles/helpers/firebase_helper/firebase_helper.dart';
import 'package:todo_app/models/HomeTaskModel/home_task_Model.dart';
import 'package:todo_app/utiles/Constants/colors.dart';

class TaskController extends GetxController {
  RxString id = ''.obs;
  var createdAt = DateTime.now().obs;
  var updateAt = DateTime.now().obs;
  RxString title = ''.obs;
  RxString description = ''.obs;
  var dueDate = DateTime.now().obs;
  RxInt iconCodePoint = 0.obs;
  RxString iconFontFamily = ''.obs;
  RxInt iconColorA = 0.obs;
  RxInt iconColorR = 0.obs;
  RxInt iconColorG = 0.obs;
  RxInt iconColorB = 0.obs;
  RxInt priorityLevel = 1.obs;
  RxString categoryName = ''.obs;
  Rx<TaskStatus> taskStatus = TaskStatus.inprogress.obs;
  RxBool checkStatus = false.obs;

  // Category
  RxInt checkCategoryIndex = 0.obs;

  // Priority
  RxInt checkPriorityIndex = 0.obs;
  RxBool check = false.obs;

  RxList<TaskModel> _listOfInProgressTasks = <TaskModel>[].obs;
  List<TaskModel> get listOfInProgressTask => _listOfInProgressTasks.value;

  // COMPLETED LIST
  RxList<TaskModel> _listOfCompletedTasks = <TaskModel>[].obs;
  List<TaskModel> get listOfCompletedTask => _listOfCompletedTasks.value;

  @override
  void onInit() {
    _listOfInProgressTasks.bindStream(getTasks(status: TaskStatus.inprogress));
    _listOfCompletedTasks.bindStream(getTasks(status: TaskStatus.completed));

    super.onInit();
  }

  togalTaskStatus({required bool value}) {
    if (value) {
      taskStatus.value = TaskStatus.completed;
    } else {
      taskStatus.value = TaskStatus.inprogress;
    }

    checkStatus.value = value;
  }

  resetControlle() {
    // id.refresh();
    // title.refresh();
  }

  updateTask({required String docId}) async {
    TaskModel model = TaskModel(
        id: id.value,
        title: title.value,
        description: description.value,
        dueDate: dueDate.value,
        updateAt: updateAt.value,
        createdAt: createdAt.value,
        iconCodePoint: iconCodePoint.value,
        iconFontFamily: iconFontFamily.value,
        iconColorA: iconColorA.value,
        iconColorB: iconColorB.value,
        iconColorG: iconColorG.value,
        iconColorR: iconColorR.value,
        priorityLevel: priorityLevel.value,
        categoryName: categoryName.value,
        status: taskStatus.value);
    await HelperFirebase.tasksFirestoreInstance
        .doc(docId)
        .update(model.toMap());
  }

  deleteTask(String id) async {
    await HelperFirebase.tasksFirestoreInstance.doc(id).delete();
  }

  Stream<List<TaskModel>> getTasks({required TaskStatus status}) {
    return HelperFirebase.tasksFirestoreInstance
        .where('status', isEqualTo: fromTaskStatus(status))
        .snapshots()
        .map(
      (event) {
        return event.docs.map(
          (e) {
            update();
            log(TaskModel.fromMap(e.data()).categoryName);
            return TaskModel.fromMap(e.data());
          },
        ).toList();
      },
    );
    // return list;
  }

  addNewTask(TaskModel model) async {
    var docRef = FirebaseFirestore.instance.collection('Tasks').doc();

    model.id = docRef.id;
    await docRef.set(model.toMap());
    update();
    Get.back();
  }

  // ....................
  editTitleAndDescription(
      {required String titleText, required String descriptionText}) {
    title.value = titleText;
    description.value = descriptionText;
    Get.back();
    update();
  }
}
