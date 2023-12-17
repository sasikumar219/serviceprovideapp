
import '../Export/export.dart';
abstract class ThemeText {
  static   var basiccolor = Color(0xffE2D9FA) ;
  static   var appcolor = Color(0xff572AC8) ;
  static  TextStyle content = GoogleFonts.roboto(
    textStyle: const TextStyle(color: Color(0xffFFFFFF),
      fontWeight:FontWeight.w800,fontSize:16,),
  );
  static  TextStyle content1 = GoogleFonts.roboto(
    textStyle: const TextStyle(color: Color(0xffFFFFFF),
      fontWeight:FontWeight.w400,fontSize:12,letterSpacing: 1),
  );
  static  TextStyle heading = GoogleFonts.roboto(
    textStyle: const TextStyle(color: Color(0xff242424),
        fontWeight:FontWeight.w700,fontSize:15,),
  );
  static  TextStyle heading1 = GoogleFonts.roboto(
    textStyle: const TextStyle(color: Color(0xff242424),
        fontWeight:FontWeight.w600,fontSize:12,),
  );
  static  TextStyle subcontent = GoogleFonts.roboto(
    textStyle: const TextStyle(color: Color(0xff757575),
        fontWeight:FontWeight.bold,fontSize:12,),
  );
  static  TextStyle subcontent2 = GoogleFonts.roboto(
    textStyle: const TextStyle(color: Color(0xff757575),
        fontWeight:FontWeight.w500,fontSize:12,),
  );
  static  TextStyle amount = GoogleFonts.roboto(
    textStyle: const TextStyle(color: Colors.black,
      fontWeight:FontWeight.w500,fontSize:16,),
  );
  static  TextStyle subconten = GoogleFonts.roboto(
    textStyle: const TextStyle(color: Colors.black,
      fontWeight:FontWeight.w400,fontSize:10,),

  );



}