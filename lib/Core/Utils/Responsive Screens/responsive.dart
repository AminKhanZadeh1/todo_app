import 'package:flutter/material.dart';
import 'package:todo_app/Core/Utils/Constants/constants.dart';
import 'package:todo_app/Features/TodoList/Presentation/Pages/Desktop/desktop_home_screen.dart';
import 'package:todo_app/Features/TodoList/Presentation/Pages/Mobile/mobile_home_screen.dart';
import 'package:todo_app/Features/TodoList/Presentation/Pages/Tablet/tablet_home_screen.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});
  final mobile = const MobileHomeScreen();
  final tablet = const TabletHomeScreen();
  final desktop = const DesktopHomeScreen();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < Constants.mobileWidth) {
          return mobile;
        } else if (constraints.maxWidth < Constants.tabletWidth) {
          return tablet;
        }
        return desktop;
      },
    );
  }
}
