import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teamintervaltest/app/data/model/data_model.dart';
import 'package:teamintervaltest/app/modules/common/colors.dart';
import 'package:teamintervaltest/app/modules/home/views/widget/detail_box.dart';
import 'package:teamintervaltest/app/modules/home/views/widget/image_view.dart';

class DetailView extends StatelessWidget {
  final Drink data;
  DetailView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.bgColor,
      appBar: AppBar(
        title: Text("Details"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(Imageviewer(
                      imageUrl: data.strDrinkThumb!,
                    ));
                  },
                  child: CircleAvatar(
                    radius: 46,
                    backgroundImage: NetworkImage(data.strDrinkThumb!),
                  ),
                ),
                SizedBox(
                  width: 14,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Id :${data.idDrink!}",
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      data.strCategory!,
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 26,
            ),
            DetailBox(boxTitle: "Name", data: data.strDrink!),
            SizedBox(
              height: 10,
            ),
            DetailBox(boxTitle: "Category", data: data.strCategory!),
            SizedBox(
              height: 10,
            ),
            DetailBox(boxTitle: "Type", data: data.strAlcoholic!),
            SizedBox(
              height: 10,
            ),
            DetailBox(boxTitle: "Instructons", data: data.strInstructions!)
          ],
        ),
      ),
    );
  }
}
