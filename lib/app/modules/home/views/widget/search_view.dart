import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamintervaltest/app/modules/common/colors.dart';
import 'package:teamintervaltest/app/modules/home/controllers/home_controller.dart';
import 'package:teamintervaltest/app/modules/home/views/widget/detail_view.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
              homeController.searchController.clear();
            },
            icon: Icon(Icons.close)),
        title: GetBuilder<HomeController>(builder: (controller) {
          return TextField(
            onChanged: (value) {
              homeController.getData(value);
            },
            autofocus: true,
            style: TextStyle(color: Colors.white),
            controller: homeController.searchController,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      homeController
                          .getData(homeController.searchController.text);
                      print(homeController.dataList.length);
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent))),
          );
        }),
      ),
      body: SizedBox(
        height: double.infinity,
        child: GetBuilder<HomeController>(builder: (context) {
          return SingleChildScrollView(
            child: Column(
              children: [
                homeController.dataList.isEmpty
                    ? Text("No data")
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              Get.to(DetailView(
                                  data: homeController.dataList[index]));
                              homeController.searchController.clear();
                            },
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(homeController
                                  .dataList[index].strDrinkThumb!),
                            ),
                            title: Text(
                              homeController.dataList[index].strDrink!,
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        },
                        itemCount: homeController.dataList.length,
                        shrinkWrap: true,
                      )
              ],
            ),
          );
        }),
      ),
    );
  }
}
