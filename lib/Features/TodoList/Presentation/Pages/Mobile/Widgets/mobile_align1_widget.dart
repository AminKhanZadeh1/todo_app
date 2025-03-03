import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Features/TodoList/Presentation/Pages/Mobile/mobile_home_screen.dart';
import 'package:todo_app/Features/TodoList/Presentation/Widgets/Dialogs/addtask_dialog.dart';

class MobileAlign1Widget extends StatelessWidget {
  const MobileAlign1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    var pColor = Theme.of(context).primaryColor;
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.all(Get.height * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: pColor == Colors.white
                            ? Colors.white
                            : Colors.grey[900],
                        border: Border.all(
                            color: pColor == Colors.white
                                ? Colors.black
                                : Colors.white,
                            width: 1.5)),
                    child: const Icon(
                      Icons.menu_book_rounded,
                      size: 40,
                    ),
                  ),

                  // const SizedBox(
                  //   height: 20,
                  // ),
                  Positioned(
                    left: -18,
                    bottom: 50,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AddDialog();
                          },
                        );
                      },
                      icon: const Icon(Icons.add_circle),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.03,
              ),
              Obx(() => Text(
                    "Number of Tasks: ${controller.tasks.length.toString()}",
                    style: TextStyle(
                        fontSize: 20,
                        color: pColor == Colors.white
                            ? Colors.white
                            : Colors.black),
                  )),
            ],
          ),
        ));
  }
}
