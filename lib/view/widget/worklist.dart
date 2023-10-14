import 'package:bjp_leader/controller/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class WorksListBuilder extends StatelessWidget {
  WorksListBuilder({super.key});
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    int lenght = homePageController.works.length;
    print("the lenght is : $lenght");
    double height = lenght * 360;
    return SizedBox(
      // color: Colors.blue,
      // constraints: BoxConstraints(maxHeight: height, minHeight: 56.0),
      height: height,
      // width: double.infinity,
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          // scrollDirection: Axis.vertical,
          itemCount: homePageController.works.length,
          itemBuilder: (context, index) {
            var list = homePageController.works[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(list.title!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month_outlined), // Use a valid icon
                      SizedBox(
                        width: 5,
                      ),
                      Text("${list.startDate!} - ${list.endDate!}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/rupees.png",
                      ),
                      Text(list.budget.toString(),
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffF77A1D))),
                      const Spacer(),
                      Container(
                        width: 79,
                        height: 24,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: const Color(0xa049d17d)),
                        child: Center(
                          child: Text(list.status!),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 162,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            image: AssetImage("assets/images/workrect.png"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                      "Lorem ipsum dolor sit amet consectetur. Quis amet ullamcorper risus mauris nunc et libero felis ipsum et quis pharetra scelerisque."),
                ),
                SizedBox(
                  height: 15,
                )
              ],
            );
          }),
    );
  }
}
