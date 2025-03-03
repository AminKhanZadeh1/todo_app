import 'package:flutter/material.dart';
import 'package:todo_app/Features/TodoList/Presentation/Pages/Desktop/Widgets/desktop_align1_widget.dart';
import 'package:todo_app/Features/TodoList/Presentation/Widgets/clear_list_widget.dart';
import 'package:todo_app/Features/TodoList/Presentation/Pages/Desktop/Widgets/desktop_listview_widget.dart';
import 'package:todo_app/Features/TodoList/Presentation/Widgets/gradient_widget.dart';
import 'package:todo_app/Features/TodoList/Presentation/Widgets/drawer_widget.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

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
          DesktopAlign1Widget(),
          ClearListButton(),
          DesktopListViewWidget()
        ])));
  }
}
