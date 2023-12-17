

import '../Export/export.dart';
import 'package:splash_view/splash_view.dart';
class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return  SplashView(
     gradient: LinearGradient(
      colors: [Colors.purple, Colors.blue],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
    ),
      loadingIndicator:SpinKitThreeBounce(
        color: Color(0xffE2D9FA),
        size: 50.0,
      ),
      logo:  ImageFade(
        width: MediaQuery.of(context).size.width*0.8,

        // whenever the image changes, it will be loaded, and then faded in:
        image:
        NetworkImage("https://www.aitag.in/skin/front/assets/img/bg/signin.png"),

        // slow-ish fade for loaded images:
        duration:
        const Duration(milliseconds: 900),

        // if the image is loaded synchronously (ex. from memory), fade in faster:
        syncDuration:
        const Duration(milliseconds: 150),

        // supports most properties of Image:
        alignment: Alignment.center,
        fit: BoxFit.cover,
        scale: 2,
        loadingBuilder: (context, progress, chunkEvent) =>
        const Center(
            child: SpinKitRipple(
              color: Color(0xffE2D9FA),
              size: 50.0,
            )),

        // displayed when an error occurs:
        errorBuilder: (context, error) =>
        const Center(
            child: SpinKitRipple(
              color: Color(0xffE2D9FA),
              size: 50.0,
            )),
      ),
      done: Done(Home()),
    );
  }
}
