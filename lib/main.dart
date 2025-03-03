import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/Features/TodoList/Data/Repository/todo_list_repositoryimpl.dart';
import 'package:todo_app/Features/TodoList/Presentation/Binding/bindings.dart';
import 'package:todo_app/Config/Theme/theme.dart';
import 'package:todo_app/Core/Utils/Routes/pagesrouting.dart';
import 'package:todo_app/Core/Utils/Responsive%20Screens/responsive.dart';
import 'package:todo_app/Features/TodoList/Presentation/Controller/todo_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final box = GetStorage();
  final TodoController getController =
      Get.put(TodoController(repo: TodoListRepoimpl()));

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        theme: getController.isSwitched.value ? darkMode : lightMode,
        debugShowCheckedModeBanner: false,
        initialBinding: MyBindings(),
        home: const ResponsiveLayout(),
        initialRoute: PageRoutes.home,
        getPages: PageRoutes.pages,
      );
    });
  }
}
