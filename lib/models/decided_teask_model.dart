// ignore_for_file: public_member_api_docs, sort_constructors_first
class DecidedTaskModel {
  String taskTitle;
  String dateTime;
  int priority;
  String category;
  DecidedTaskModel(
      {required this.taskTitle,
      required this.dateTime,
      required this.priority,
      required this.category});

  static List<DecidedTaskModel> listOfDecidedTask = [
    DecidedTaskModel(
        taskTitle: 'Do Math Work',
        dateTime: 'ToDay At ${DateTime.now().hour}:${DateTime.now().minute}',
        priority: 1,
        category: 'Home'),
    DecidedTaskModel(
        taskTitle: 'Do English Work',
        dateTime: 'ToDay At ${DateTime.now().hour}:${DateTime.now().minute}',
        priority: 2,
        category: 'University'),
    DecidedTaskModel(
        taskTitle: 'Do Computer Work',
        dateTime: 'ToDay At ${DateTime.now().hour}:${DateTime.now().minute}',
        priority: 3,
        category: 'Work'),
    DecidedTaskModel(
        taskTitle: 'Do Cloude Computing Work',
        dateTime: 'ToDay At ${DateTime.now().hour}:${DateTime.now().minute}',
        priority: 4,
        category: 'Home'),
    DecidedTaskModel(
        taskTitle: 'Do Internet Of things Work',
        dateTime: 'ToDay At ${DateTime.now().hour}:${DateTime.now().minute}',
        priority: 5,
        category: 'Work'),
  ];
}
