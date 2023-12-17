
import 'package:serviceprovicerapp/view/Commonpage/splashscreen.dart';

import '../Export/export.dart';

class AppRoutes {
  static const String home = '/home';
  static const String multipleservice = '/multipleservice';
  static const String splashscreen = '/splashscreen';


  static List<GetPage> pages = [

    GetPage(
      name: splashscreen,
      page: () =>  const Splashscreen(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(seconds: 1),
      bindings: [
        // LoginBinding(),
      ],
    ),
    GetPage(
      name: home,
      page: () =>  const Home(),
      transition: Transition.leftToRight,
      transitionDuration:const Duration(seconds: 1),
      bindings: [
        // LoginBinding(),
      ],
    ),





























  ];
}