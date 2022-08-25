import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:teamintervaltest/app/data/model/data_model.dart';
import 'package:teamintervaltest/app/modules/common/colors.dart';

import 'package:teamintervaltest/app/modules/home/views/widget/detail_view.dart';
import 'package:teamintervaltest/app/modules/home/views/widget/search_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CommonColors.bgColor,
        appBar: AppBar(
          title: Text("Home"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(SearchView());
                },
                icon: Icon(Icons.search))
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                    future: homeController.getData("rum"),
                    builder: ((context, AsyncSnapshot<List<Drink>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasData) {
                        List<Drink>? data = snapshot.data;

                        return ListView.separated(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: ListTile(
                                onTap: () {
                                  Get.to(DetailView(
                                    data: data![index],
                                  ));
                                },
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "${data![index].strDrinkThumb}"),
                                ),
                                title: Text(
                                  "${data[index].strDrink}",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 5,
                            );
                          },
                          itemCount: homeController.dataList.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }))
              ],
            ),
          ),
        ));
  }
}
