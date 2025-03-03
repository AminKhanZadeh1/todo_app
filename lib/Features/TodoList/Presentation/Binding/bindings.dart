import 'package:get/get.dart';
import 'package:todo_app/Features/TodoList/Data/Repository/todo_list_repositoryimpl.dart';
import 'package:todo_app/Features/TodoList/Presentation/Controller/todo_controller.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController(repo: TodoListRepoimpl()));
  }
}
