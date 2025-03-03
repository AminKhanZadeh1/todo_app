import 'package:flutter/material.dart';
import 'package:todo_app/Features/TodoList/Presentation/Pages/Mobile/mobile_home_screen.dart';

class ClearListButton extends StatelessWidget {
  const ClearListButton({super.key});

  @override
  Widget build(BuildContext context) {
    var pColor = Theme.of(context).primaryColor;

    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                    pColor == Colors.white ? Colors.white : Colors.grey[900])),
            onPressed: () {
              controller.clearData();
            },
            child: Text(
              'Clear List',
              style: TextStyle(
                  color: pColor == Colors.white ? Colors.black : Colors.white,
                  fontSize: 10),
            )),
      ),
    );
  }
}
