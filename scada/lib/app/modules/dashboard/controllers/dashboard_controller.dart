import 'package:get/get.dart';

class DashboardController extends GetxController {
  final containers = <String>[].obs;
  final isSwitched = false.obs;

  void addContainer(String type) {
    containers.add(type);
  }

  void deleteContainer(int index) {
    containers.removeAt(index);
  }

  void toggleSwitch() {
    isSwitched.toggle();
  }

}
