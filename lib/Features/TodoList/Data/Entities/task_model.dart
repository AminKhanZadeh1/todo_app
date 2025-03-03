// ignore_for_file: overridden_fields, annotate_overrides

import 'package:todo_app/Features/TodoList/Domain/Entities/task_entity.dart';

class TaskModel {
  Task task;

  TaskModel({required this.task});

  Map<String, dynamic> get toJson => {
        'taskTitle': task.title,
        'taskSubtitle': task.subtitle,
        'status': task.status
      };

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
      task: Task(
          title: json['taskTitle'],
          subtitle: json['taskSubtitle'],
          status: json['status']));
}
