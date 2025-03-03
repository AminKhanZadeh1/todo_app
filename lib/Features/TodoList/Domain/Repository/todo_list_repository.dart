import 'package:todo_app/Features/TodoList/Data/Entities/task_model.dart';

abstract class TodoListRepo {
  List<TaskModel> getData();
  void addTask(TaskModel task);
  void deleteTask(int index);
  void updateTask(int index, TaskModel task);
  void statusChanged(int index);
  void clearData();
}
