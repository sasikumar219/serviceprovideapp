// @dart=2.9
import 'package:serviceprovicerapp/view/Commonpage/splashscreen.dart';
import '../view/Export/export.dart';
import 'package:flutter/material.dart';
Future main() async {

  WidgetsFlutterBinding.ensureInitialized();

  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily:'Roboto',
          ),
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget,
            );
          },
          home:  const Splashscreen(),
         // initialRoute: AppRoutes.introduction,
          getPages: AppRoutes.pages,
          // initialBinding: CommonBindings(),
        );
      },
    );
  }
}