// ignore_for_file: public_member_api_docs, sort_constructors_first
class CompletedTaskModel {
  String taskTitle;
  String dateTime;
  CompletedTaskModel({
    required this.taskTitle,
    required this.dateTime,
  });

  static List<CompletedTaskModel> listOFCompletedTask = [
    CompletedTaskModel(taskTitle: 'Gym', dateTime: 'Today At 10:00'),
    CompletedTaskModel(taskTitle: 'Game', dateTime: 'Today At 5:00'),
    CompletedTaskModel(taskTitle: 'Game', dateTime: 'Today At 5:00'),
    CompletedTaskModel(taskTitle: 'Game', dateTime: 'Today At 5:00'),
  ];
}
