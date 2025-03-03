import 'package:todo_app/Features/TodoList/Data/Entities/task_model.dart';
import 'package:todo_app/Features/TodoList/Data/Source/Local/todo_list_local.dart';
import 'package:todo_app/Features/TodoList/Domain/Repository/todo_list_repository.dart';
import 'package:todo_app/Features/TodoList/Presentation/Pages/Mobile/mobile_home_screen.dart';

class TodoListRepoimpl implements TodoListRepo {
  @override
  List<TaskModel> getData() {
    if (LocalData.tasks.isNotEmpty) {
      List<TaskModel> data = [];
      for (var item in LocalData.tasks) {
        TaskModel itemToModel = TaskModel.fromJson(item);
        data.add(itemToModel);
      }
      return data;
    }
    return [];
  }

  @override
  void addTask(TaskModel task) {
    LocalData.tasks.add(task.toJson);
    box.write('List', LocalData.tasks);
  }

  @override
  void deleteTask(int index) {
    LocalData.tasks.removeAt(index);
    box.write('List', LocalData.tasks);
  }

  @override
  void statusChanged(int index) {
    LocalData.tasks[index]['status'] = !LocalData.tasks[index]['status'];
    box.write('List', LocalData.tasks);
  }

  @override
  void updateTask(int index, TaskModel task) {
    LocalData.tasks[index] = task.toJson;
    box.write('List', LocalData.tasks);
  }

  @override
  void clearData() {
    LocalData.tasks.clear();
    box.remove('List');
  }
}
