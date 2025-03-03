import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/Features/TodoList/Presentation/Pages/Mobile/mobile_home_screen.dart';
import 'package:todo_app/Features/TodoList/Presentation/Widgets/Dialogs/addtask_dialog.dart';

class TabletAlign1Widget extends StatelessWidget {
  const TabletAlign1Widget({super.key});

  @override
  Widget build(BuildContext context) {
    var pColor = Theme.of(context).primaryColor;
    return Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.sizeOf(context).height * 0.08),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).height * 0.15,
                    height: MediaQuery.sizeOf(context).height * 0.15,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: pColor == Colors.white
                            ? Colors.white
                            : Colors.grey[900],
                        border: Border.all(
                            color: pColor == Colors.white
                                ? Colors.black
                                : Colors.white,
                            width: 2)),
                    child: const Icon(
                      Icons.menu_book_rounded,
                      size: Checkbox.width * 3,
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.sizeOf(context).width * -0.02,
                    bottom: MediaQuery.sizeOf(context).height * 0.09,
                    child: IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AddDialog();
                          },
                        );
                      },
                      icon: Icon(
                        Icons.add_circle,
                        size: MediaQuery.sizeOf(context).height * 0.04,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.04,
              ),
              Obx(() => Text(
                    "Number of Tasks: ${controller.tasks.length.toString()}",
                    style: TextStyle(
                        fontSize: Checkbox.width * 1.5,
                        color: pColor == Colors.white
                            ? Colors.white
                            : Colors.black),
                  )),
            ],
          ),
        ));
  }
}
