import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  DashboardView({Key? key}) : super(key: key);
  final DashboardController controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashboardView'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            
            child: Obx(
              () => ListView.builder(
                itemCount: controller.containers.length,
                itemBuilder: (context, index) {
                  final containerType = controller.containers[index];

                  return GestureDetector(
                    onLongPress: () {
                      controller.deleteContainer(index);
                    },
                    child: Container(
                      height: 100,
                      color: Colors.blue,
                      margin: EdgeInsets.all(8),
                      child: Center(
                        child: Text(containerType),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Obx(
              () => ListView.builder(
                itemCount: controller.containers.length,
                itemBuilder: (context, index) {
                  final containerType = controller.containers[index];

          
                    return 
                    Container(color: Colors.red,
                    // ListTile(
                    // leading: Obx(
                    //   () => FlutterSwitch(
                    //     activeColor: Colors.green,
                    //     value: controller.isSwitched.value,
                    //     onToggle: (value) {
                    //       controller.toggleSwitch();
                    //     },
                    //   ),
                    // ),
                    // title: Text(containerType),
                  
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showOptionsDialog();
        },
        child: Icon(Icons.add),
      ),
    
    );
  }

 
  void showOptionsDialog() {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Add Camera'),
                onTap: () {
                  controller.addContainer('Camera');
                  Get.back();
                },
              ),
              ListTile(
                leading: Icon(Icons.lightbulb),
                title: Text('Add Light'),
                onTap: () {
                  controller.addContainer('Light');
                  Get.back();
                },
              ),
            ],
          ),
        );
      },
    );
  }

}