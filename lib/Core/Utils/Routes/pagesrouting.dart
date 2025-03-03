import 'package:get/get.dart';
import 'package:todo_app/Features/TodoList/Presentation/Binding/bindings.dart';
import 'package:todo_app/Features/TodoList/Presentation/Pages/about.dart';
import 'package:todo_app/Core/Utils/Responsive%20Screens/responsive.dart';

class PageRoutes {
  static const home = '/home';
  static const info = '/info';

  static List<GetPage> pages = [
    GetPage(
        name: PageRoutes.home,
        page: () => const ResponsiveLayout(),
        binding: MyBindings(),
        transition: Transition.rightToLeft),
    GetPage(
        name: PageRoutes.info,
        page: () => const InfoPage(),
        transition: Transition.rightToLeft)
  ];
}
