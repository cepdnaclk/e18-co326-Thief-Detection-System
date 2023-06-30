
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';


class HomeController extends GetxController {

  final SidebarXController sidebarXController = SidebarXController(selectedIndex: 0, extended: true);

  var title = ("MainOffice").obs;

  @override
  void onInit() async {

    sidebarXController.addListener(() {
      if(sidebarXController.selectedIndex==0){
        title.value = "MainOffice";
      }else if(sidebarXController.selectedIndex==1){
        title.value = "Parking";
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}