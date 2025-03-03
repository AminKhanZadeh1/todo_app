import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/Config/Theme/theme.dart';
import 'package:todo_app/Features/TodoList/Presentation/Controller/todo_controller.dart';
import 'package:todo_app/Core/Utils/Routes/pagesrouting.dart';

class DrawerWidget extends StatelessWidget {
  final int? id;
  DrawerWidget({super.key, this.id});

  final box = GetStorage();
  final TodoController getController = Get.find();

  @override
  Widget build(BuildContext context) {
    getController.isSwitched.value = box.read('theme') ?? false;
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Center(
              child: Text(
                'T  O  D  O\nL  I  S  T ',
                style: TextStyle(fontSize: 35, fontFamily: 'Punches'),
              ),
            ),
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(
                  Icons.task_alt,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text('Tasks'),
              ],
            ),
            onTap: () {
              if (id == null) {
                Navigator.pop(context);
              } else {
                Get.toNamed(PageRoutes.home);
              }
            },
          ),
          const SizedBox(
            height: 7,
          ),
          const SizedBox(
            height: 7,
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text('About'),
              ],
            ),
            onTap: () {
              if (id == 1) {
                Navigator.pop(context);
              } else {
                Get.toNamed(PageRoutes.info);
              }
            },
          ),
          SizedBox(
            height: Get.height > 600 ? Get.height * 0.4 : Get.height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.sunny,
                size: 25,
              ),
              const SizedBox(
                width: 5,
              ),
              Obx(() {
                return Switch(
                    value: getController.isSwitched.value,
                    onChanged: (value) {
                      getController.toggleTheme();
                      Get.changeTheme(getController.isSwitched.value
                          ? darkMode
                          : lightMode);
                    });
              }),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.nightlight,
                size: 25,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
