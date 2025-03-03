import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Features/TodoList/Data/Entities/task_model.dart';
import 'package:todo_app/Features/TodoList/Domain/Entities/task_entity.dart';
import 'package:todo_app/Features/TodoList/Presentation/Pages/Mobile/mobile_home_screen.dart';

class EditDialog extends StatelessWidget {
  EditDialog({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    controller.taskTitle.text =
        controller.tasks[controller.indexNumber].task.title;
    controller.taskSubtitle.text =
        controller.tasks[controller.indexNumber].task.subtitle;
    Color pcolor = Theme.of(context).primaryColor;
    return Dialog(
      child: Container(
        height: 380,
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(
              color:
                  pcolor == Colors.white ? Colors.grey.shade900 : Colors.white,
              width: 3),
          borderRadius: BorderRadius.circular(20),
          color: pcolor,
        ),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: const Icon(Icons.arrow_back_ios),
                        ),
                      ),
                      const Text(
                        'Edit Task',
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        width: 30,
                        height: 60,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      validator: (title) => title!.isEmpty ? 'Empty' : null,
                      maxLength: 20,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          label: const Text('Task Title'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                      controller: controller.taskTitle,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      validator: (subTitle) =>
                          subTitle!.isEmpty ? 'Empty' : null,
                      maxLength: 30,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          label: const Text('Task Subtitle'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                      controller: controller.taskSubtitle,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.red[400]),
                              foregroundColor:
                                  const WidgetStatePropertyAll(Colors.white)),
                          onPressed: () {
                            controller.deleteTask(controller.indexNumber);
                            Get.back();
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    duration: Duration(seconds: 1),
                                    content: Text(
                                      'Task deleted',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    backgroundColor: Colors.red));
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Delete',
                                style: TextStyle(
                                  fontSize: 11,
                                ),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Icon(
                                color: Colors.white,
                                Icons.delete,
                                size: 20,
                              )
                            ],
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          style: const ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.green),
                              foregroundColor:
                                  WidgetStatePropertyAll(Colors.white)),
                          onPressed: () {
                            _formKey.currentState!.validate();
                            if (controller.taskTitle.text.isNotEmpty &&
                                controller.taskSubtitle.text.isNotEmpty) {
                              controller.updateTask(
                                  controller.indexNumber,
                                  TaskModel(
                                      task: Task(
                                          title: controller.taskTitle.text,
                                          subtitle:
                                              controller.taskSubtitle.text,
                                          status: controller
                                              .tasks[controller.indexNumber]
                                              .task
                                              .status)));
                              Get.back();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      duration: Duration(seconds: 1),
                                      content: Text(
                                        'Task edited',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: Colors.blue));
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(left: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Edit',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Icon(
                                  color: Colors.white,
                                  Icons.edit,
                                  size: 20,
                                )
                              ],
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
