import 'package:todo_app/Features/TodoList/Presentation/Pages/Mobile/mobile_home_screen.dart';

class LocalData {
  static List<Map<String, dynamic>> tasks = [];

  void getData() {
    if (box.read('List') != null) {
      var list = box.read('List');
      for (var item in list) {
        tasks.add(item);
      }
    }
  }
}
