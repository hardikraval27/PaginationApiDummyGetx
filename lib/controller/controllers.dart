import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/model_dummy.dart';

class HomeController extends GetxController {
  var postList = <mydumy>[].obs;
  var isLoading = false.obs;
  var currentPage = 0.obs;
  var totalPage = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchdata();
  }

  Future<void> fetchdata() async {
    isLoading.value = true;

    final response = await http
        .get(Uri.parse("https://dummyjson.com/products/${currentPage.value}"));
    final responsed = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print(responsed);
      // postList.value = mydumy.fromJson(responsed);
      postList.addAll(List.from([responsed])
          .map<mydumy>((e) => mydumy.fromJson(e))
          .toList());
      //  currentPage = responsed![15]["currentPage"];
      isLoading.value = false;
      update();
    } else {
      Get.snackbar('Error Loading data!',
          'Server responsed:${response.statusCode}:${response.reasonPhrase.toString()}');
    }
  }
}
