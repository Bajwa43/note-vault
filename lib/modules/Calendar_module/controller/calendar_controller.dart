import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:todo_app/models/HomeTaskModel/home_task_Model.dart';
import 'package:todo_app/modules/home_module/controller/task_controller.dart';
import 'package:todo_app/utiles/helpers/firebase_helper/firebase_helper.dart';

class CalendarController extends GetxController {
  RxBool completedBtnOffFocus = true.obs;
  RxBool todayBtnOffFocus = false.obs;
  Rx<DateTime> focusDate = DateTime.now().obs;
  RxList<TaskModel> taskes = RxList([]);

  TaskController _tc = Get.find<TaskController>();

  // getDocBaseOnDate() async {
  //    HelperFirebase.tasksFirestoreInstance
  //       .orderBy('dueDate')
  //       .startAt([focusDate.value]).endAt([focusDate.value]).get();
  // }

  // INPROGREE LIST

  RxList<TaskModel> _listOfInProgressTasks = <TaskModel>[].obs;
  List<TaskModel> get listOfInProgressTask => _listOfInProgressTasks.value;

  // COMPLETED LIST
  RxList<TaskModel> _listOfCompletedTasks = <TaskModel>[].obs;
  List<TaskModel> get listOfCompletedTask => _listOfCompletedTasks.value;

  RxList<TaskModel> filterdList = <TaskModel>[].obs;
  List<TaskModel> get getFilterdList => filterdList.value;

  @override
  void onInit() {
    _listOfInProgressTasks.bindStream(
        getTasks(status: TaskStatus.inprogress, dueDateTime: focusDate.value));
    _listOfCompletedTasks.bindStream(
        getTasks(status: TaskStatus.completed, dueDateTime: focusDate.value));
    super.onInit();
  }

  Stream<List<TaskModel>> getTasks(
      {required TaskStatus status, required DateTime dueDateTime}) {
    log('At get TASK : ${dueDateTime.toString()}');

    DateTime dueDate =
        DateTime(dueDateTime.year, dueDateTime.month, dueDateTime.day);
    return HelperFirebase.tasksFirestoreInstance
        .where('dueDate', isEqualTo: dueDate.millisecondsSinceEpoch)
        .where('status', isEqualTo: fromTaskStatus(status))
        // .orderBy('dueDate')
        // .startAt([
        //   DateTime(focusDate.value.year, focusDate.value.weekday,
        //       focusDate.value.day)
        // ])
        // .endAt([
        //   DateTime(focusDate.value.year, focusDate.value.weekday,
        //       focusDate.value.day)
        // ])
        .snapshots()
        .map(
      (event) {
        // log(dueDate.toString());
        // update();

        return event.docs.map(
          (e) {
            // log(dueDate.toString());
            log('At Item  : ${dueDate.toString()}');

            log('This is Itme : ${TaskModel.fromMap(e.data()).dueDate.toString()}');

            update();
            log(TaskModel.fromMap(e.data()).dueDate.toString());
            return TaskModel.fromMap(e.data());
          },
        ).toList();
      },
    );
    // return list;
  }

  Future<List<TaskModel>> getAllTasksOnThatRange(
      DateTime dueDateTime, TaskStatus taskStatus) async {
    // log(dueDateTime.toString());
    // log();

    DateTime dueDate =
        DateTime(dueDateTime.year, dueDateTime.month, dueDateTime.day);

    List<TaskModel> takes = [];
    var list = await HelperFirebase.tasksFirestoreInstance
        .where('dueDate', isEqualTo: dueDate.millisecondsSinceEpoch)
        .where('status', isEqualTo: fromTaskStatus(taskStatus))
        .get();
    for (var element in list.docs) {
      // log("Item : ${dueDate.millisecondsSinceEpoch}");
      log("Item My : ${dueDate}");

      log("Item : ${TaskModel.fromMap(element.data()).dueDate}");
      takes.add(TaskModel.fromMap(element.data()));
    }
    filterdList.value = takes;
    return takes;
  }
}
