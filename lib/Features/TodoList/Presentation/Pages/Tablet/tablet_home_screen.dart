import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/Features/TodoList/Presentation/Controller/todo_controller.dart';
import 'package:todo_app/Features/TodoList/Presentation/Pages/Tablet/Widgets/tablet_align1_widget.dart';
import 'package:todo_app/Features/TodoList/Presentation/Pages/Tablet/Widgets/tablet_listview_widget.dart';
import 'package:todo_app/Features/TodoList/Presentation/Widgets/clear_list_widget.dart';
import 'package:todo_app/Features/TodoList/Presentation/Widgets/gradient_widget.dart';
import 'package:todo_app/Features/TodoList/Presentation/Widgets/drawer_widget.dart';

final TodoController controller = Get.find();
final box = GetStorage();

class TabletHomeScreen extends StatelessWidget {
  const TabletHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var pColor = Theme.of(context).primaryColor;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: pColor,
          scrolledUnderElevation: 0,
          title: const Text(
            'Todo List',
            style: TextStyle(fontFamily: 'Punches', fontSize: 30),
          ),
          centerTitle: true,
        ),
        drawer: DrawerWidget(),
        body: const SafeArea(
            child: Stack(alignment: Alignment.bottomCenter, children: [
          GradientScreen(),
          TabletAlign1Widget(),
          ClearListButton(),
          TabletListViewWidget()
        ])));
  }
}
