import 'dart:convert';

import 'package:get/get.dart';
import 'package:teamintervaltest/app/data/model/data_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  // //TODO: Implement HomeController

  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}
  // void increment() => count.value++;

  List<Drink> dataList = [];
  final String apiUrl =
      "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=rum";

  Future<List<Drink>> getData() async {
    final response = await http.get(Uri.parse(apiUrl));
    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['drinks'];

        dataList = body.map((item) => Drink.fromJson(item)).toList();
        update();

        return dataList;
      } else {
        throw ("cannot get data");
      }
    } catch (e) {
      print(e.toString());
    }
    return dataList;
  }
}
