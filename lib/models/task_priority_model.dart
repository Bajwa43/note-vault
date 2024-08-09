// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:todo_app/data/app_assets.dart';

class TaskPriorityModel {
  String path;
  int no;
  TaskPriorityModel({
    required this.path,
    required this.no,
  });

  static List<TaskPriorityModel> listOfTaskPriority = [
    TaskPriorityModel(path: KAppAssets.flagImage, no: 1),
    TaskPriorityModel(path: KAppAssets.flagImage, no: 2),
    TaskPriorityModel(path: KAppAssets.flagImage, no: 3),
    TaskPriorityModel(path: KAppAssets.flagImage, no: 4),
    TaskPriorityModel(path: KAppAssets.flagImage, no: 5),
    TaskPriorityModel(path: KAppAssets.flagImage, no: 6),
    TaskPriorityModel(path: KAppAssets.flagImage, no: 7),
    TaskPriorityModel(path: KAppAssets.flagImage, no: 8),
    TaskPriorityModel(path: KAppAssets.flagImage, no: 9),
    TaskPriorityModel(path: KAppAssets.flagImage, no: 10),
  ];
}
