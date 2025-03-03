import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Features/TodoList/Presentation/Controller/todo_controller.dart';
import 'package:todo_app/Features/TodoList/Presentation/Pages/Mobile/mobile_home_screen.dart';
import 'package:todo_app/Features/TodoList/Presentation/Widgets/Dialogs/edittask_dialog.dart';

class DesktopListViewWidget extends StatelessWidget {
  const DesktopListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var pColor = Theme.of(context).primaryColor;
    return Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.6,
        decoration: BoxDecoration(
            color: pColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Container(
            margin: const EdgeInsets.all(10),
            child: Obx(() {
              if (controller.tasks.isNotEmpty) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                  child: ListView.separated(
                      itemCount: controller.tasks.length,
                      itemBuilder: (context, index) {
                        return Container(
                            height: 70,
                            decoration: BoxDecoration(
                                gradient: pColor == Colors.white
                                    ? const LinearGradient(colors: [
                                        Color.fromARGB(255, 218, 226, 240),
                                        Color.fromARGB(255, 230, 230, 230),
                                        Color.fromARGB(255, 233, 240, 172)
                                      ])
                                    : LinearGradient(colors: [
                                        Colors.grey.shade800,
                                        Colors.grey.shade600,
                                        const Color.fromARGB(255, 243, 139, 139)
                                      ]),
                                borderRadius: BorderRadius.circular(40)),
                            child: Center(
                              child: ListTile(
                                  onLongPress: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        // Assert the index of tasks for show dialog
                                        controller.indexNumber = index;
                                        return EditDialog();
                                      },
                                    );
                                  },
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  onTap: () {},
                                  title: SizedBox(
                                    height: 18,
                                    child: Text(
                                      controller.tasks[index].task.title,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  subtitle: SizedBox(
                                    height: 18,
                                    child: Text(
                                      controller.tasks[index].task.subtitle,
                                      style: const TextStyle(fontSize: 10),
                                    ),
                                  ),
                                  trailing: GetBuilder<TodoController>(
                                    builder: (controller) {
                                      return Checkbox(
                                        activeColor: Colors.blue,
                                        onChanged: (value) {
                                          controller.statusChange(index);
                                        },
                                        value:
                                            controller.tasks[index].task.status,
                                      );
                                    },
                                  )),
                            ));
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 15,
                        );
                      }),
                );
              } else {
                return Center(
                    child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/patrick-list.gif'),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 2,
                          color: pColor == Colors.white
                              ? Colors.black
                              : Colors.white)),
                ));
              }
            })));
  }
}
