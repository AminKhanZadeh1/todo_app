// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Features/TodoList/Data/Entities/task_model.dart';
import 'package:todo_app/Features/TodoList/Domain/Entities/task_entity.dart';
import 'package:todo_app/Features/TodoList/Presentation/Pages/Mobile/mobile_home_screen.dart';

class AddDialog extends StatelessWidget {
  AddDialog({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color pcolor = Theme.of(context).primaryColor;
    controller.taskTitle.clear();
    controller.taskSubtitle.clear();
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
                        'Add Task',
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      validator: (title) => title!.isEmpty ? 'Empty' : null,
                      maxLength: 20,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          label: const Text(
                            'Task Title',
                            style: TextStyle(fontSize: 15),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                      controller: controller.taskTitle,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      validator: (subTitle) =>
                          subTitle!.isEmpty ? 'Empty' : null,
                      maxLength: 30,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          label: const Text(
                            'Task Subtitle',
                            style: TextStyle(fontSize: 15),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                      controller: controller.taskSubtitle,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.validate();
                      if (controller.taskTitle.text.isNotEmpty &&
                          controller.taskSubtitle.text.isNotEmpty) {
                        controller.addData(TaskModel(
                            task: Task(
                                title: controller.taskTitle.text,
                                subtitle: controller.taskSubtitle.text,
                                status: false)));
                        Get.back();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                duration: Duration(seconds: 1),
                                content: Text(
                                  'Task added',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.green));
                      }
                    },
                    style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            Color.fromARGB(255, 87, 145, 245)),
                        foregroundColor: WidgetStatePropertyAll(Colors.white)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Add',
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
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
