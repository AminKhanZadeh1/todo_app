import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/Features/TodoList/Data/Entities/task_model.dart';
import 'package:todo_app/Features/TodoList/Data/Source/Local/todo_list_local.dart';
import 'package:todo_app/Features/TodoList/Domain/Repository/todo_list_repository.dart';

class TodoController extends GetxController {
  // Repository
  late TodoListRepo repo;

  TodoController({required this.repo});

  // TextField Controllers
  TextEditingController taskTitle = TextEditingController();
  TextEditingController taskSubtitle = TextEditingController();

  // Tasks
  final box = GetStorage();
  RxList<TaskModel> tasks = RxList<TaskModel>([]);

  int indexNumber = 0;

  // Theme
  RxBool isSwitched = false.obs;

  // Add data
  void addData(TaskModel task) {
    repo.addTask(task);
    tasks.assignAll(repo.getData());
  }

  // Change the bool of task status
  void statusChange(int index) {
    tasks[index].task.status = !tasks[index].task.status;
    repo.statusChanged(index);
    tasks.assignAll(repo.getData());
  }

  // Update data
  void updateTask(int index, TaskModel task) {
    repo.updateTask(index, task);
    tasks.assignAll(repo.getData());
  }

  // Delete data
  void deleteTask(int index) {
    repo.deleteTask(index);
    tasks.assignAll(repo.getData());
  }

  // Clear data
  void clearData() {
    repo.clearData();
    tasks.clear();
  }

  @override
  void onInit() async {
    LocalData().getData();
    tasks = repo.getData().obs;
    isSwitched.value = box.read('theme') ?? false;
    super.onInit();
  }

  void toggleTheme() {
    isSwitched.value = !isSwitched.value;
    box.write('theme', isSwitched.value);
  }
}
