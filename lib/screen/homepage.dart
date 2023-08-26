import 'package:dummypaginationapi/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: controller.isLoading.value
                ? CircularProgressIndicator()
                : NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo is UserScrollNotification) {
                        if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                          if ((controller.currentPage.value + 1) <
                              controller.totalPage.value) {
                            controller.currentPage.value =
                                controller.currentPage.value + 1;
                            // controller.fetchdata();
                          }
                        }
                      }
                      return true;
                    },
                    child: ListView.builder(
                      itemCount: controller.postList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "${controller.postList[index].thumbnail}",
                                scale: 1),
                          ),
                          title: Text("${controller.postList[index].title}"),
                          subtitle:
                              Text("${controller.postList[index].description}"),
                        );
                      },
                    ),
                    // child: controller.isLoading.value
                    //     ? CircularProgressIndicator()
                    //     : Card(
                    //         child: Container(
                    //           decoration:
                    //               BoxDecoration(border: Border.all(width: 1)),
                    //           child: Row(
                    //             children: [
                    //               Container(
                    //                 height: Get.height * 0.2,
                    //                 width: Get.width * 0.3,
                    //                 child: Image.network(
                    //                   "${controller.postList.value.thumbnail}",
                    //                 ),
                    //               ),
                    //               SizedBox(
                    //                 width: 2,
                    //               ),
                    //               Expanded(
                    //                 child: Container(
                    //                   height: Get.height * 0.2,
                    //                   width: Get.width * 0.3,
                    //                   child: Column(
                    //                     mainAxisAlignment: MainAxisAlignment.center,
                    //                     children: [
                    //                       Text("${controller.postList.value.id}"),
                    //                       Text(
                    //                           "${controller.postList.value.title}"),
                    //                       Text(
                    //                           "${controller.postList.value.description}"),
                    //                       Text(
                    //                           "${controller.postList.value.discountPercentage}"),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       )
                    // body: controller.isLoading.value
                    //     ? CircularProgressIndicator()
                    //     : ListView.builder(
                    //         itemBuilder: (context, index) {
                    //           return ListTile(
                    //             leading: CircleAvatar(
                    //               backgroundImage: NetworkImage(
                    //                   "${controller.postList[index].thumbnail![index]}"),
                    //             ),
                    //             title: Text("${controller.postList[index].title}"),
                    //             subtitle:
                    //                 Text("${controller.postList[index].description}"),
                    //           );
                    //         },
                    //       ),
                  ),
          );
        },
      ),
    );
  }
}
