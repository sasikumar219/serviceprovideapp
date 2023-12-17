
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Apiservice/api_service.dart';
import '../Model/home_Model.dart';
import '../view/Export/export.dart';


class Homecontroller extends GetxController {

  @override
  void onInit() {
    homescreen("products");
    super.onInit();
  }
var searchdata;
  var homescreenResponseStatus=false.obs;
  var homeproductData = Homemodel().obs;

  Future homescreen(String endPoint) async {

    try {
      var homeResponse = await ApiService().get(endpoint:endPoint);
      if (homeResponse.statusCode == 200) {
        var result = Homemodel.fromJson(homeResponse.data);
        homeproductData.value = result;
        homescreenResponseStatus.value = true;
        update();
      }
    } catch (e) {
      debugPrint(e.toString());
      var array = e.toString().split(': ');
      if (array.length > 1) {
        var secondArray = array[1].split(' [');
        if (secondArray.length > 1) {
          Get.snackbar('', secondArray[0],
              backgroundColor: Colors.white);
        } else {
          Get.snackbar('', 'something went wrong',
              backgroundColor: Colors.white);
        }
      } else {
        Get.snackbar('', 'something went wrong', backgroundColor: Colors.white);
      }
    } finally {

      homescreenResponseStatus.value = true;
      update();
    }
  }


}