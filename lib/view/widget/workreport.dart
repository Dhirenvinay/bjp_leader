import 'package:bjp_leader/view/widget/worklist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_page.dart';

class WorkReportScreen extends StatelessWidget {
  WorkReportScreen({super.key});
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Container(
                  width: 70,
                  height: 58,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffFFBE52).withOpacity(0.3)),
                  child: Center(
                      child: Text(
                          homePageController.workstats.value.total.toString(),
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ))),
                ),
                const Text("Total Work",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      // color: Color(0xffC58318)
                    ))
              ],
            ),
            Column(
              children: [
                Container(
                  width: 70,
                  height: 58,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xbcffbe52)),
                  child: Center(
                      child: Text(
                          homePageController.workstats.value.done.toString(),
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w700,
                          ))),
                ),
                const Text("Complete",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ))
              ],
            ),
            Column(
              children: [
                Container(
                  width: 70,
                  height: 58,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xffc4d7ff)),
                  child: Center(
                      child: Text(
                          homePageController.workstats.value.underWork
                              .toString(),
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff3C65BC)))),
                ),
                const Text("Under Work",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ))
              ],
            ),
            Column(
              children: [
                Container(
                  width: 70,
                  height: 58,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0x992fd1c5)),
                  child: Center(
                      child: Text(
                          homePageController.workstats.value.workStartSoon
                              .toString(),
                          style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff20817A)))),
                ),
                const Text("Upcoming Work",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
          ],
        ),
        // const SizedBox(
        //   height: 10,
        // ),
        WorksListBuilder()
        // const Padding(
        //   padding: EdgeInsets.only(left: 16),
        //   child: Align(
        //     alignment: Alignment.centerLeft,
        //     child: Text("Mewar - Kota Highway construction",
        //         style: TextStyle(
        //           fontSize: 16,
        //           fontWeight: FontWeight.w600,
        //         )),
        //   ),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        // const Padding(
        //   padding: EdgeInsets.only(left: 16),
        //   child: Row(
        //     children: [
        //       Icon(Icons.calendar_month_outlined),
        //       SizedBox(
        //         width: 5,
        //       ),
        //       Text("05 May 2022- 25 Oct 2023",
        //           style: TextStyle(
        //             fontSize: 12,
        //             fontWeight: FontWeight.w600,
        //           ))
        //     ],
        //   ),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 16),
        //   child: Row(
        //     children: [
        //       Image.asset(
        //         "assets/icons/rupees.png",
        //       ),
        //       const Text("78.55 Cr",
        //           style: TextStyle(
        //               fontSize: 14,
        //               fontWeight: FontWeight.w600,
        //               color: Color(0xffF77A1D))),
        //       const Spacer(),
        //       Container(
        //         width: 79,
        //         height: 24,
        //         margin: const EdgeInsets.only(right: 16),
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(4),
        //             color: const Color(0xa049d17d)),
        //         child: const Center(
        //           child: Text("Complete"),
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        // const SizedBox(
        //   height: 10,
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 16, right: 16),
        //   child: Container(
        //     width: MediaQuery.of(context).size.width * 0.95,
        //     height: 162,
        //     decoration: BoxDecoration(
        //         image: const DecorationImage(
        //             image: AssetImage("assets/images/workrect.png"),
        //             fit: BoxFit.cover),
        //         borderRadius: BorderRadius.circular(15)),
        //   ),
        // ),
        // const SizedBox(
        //   height: 8,
        // ),
        // const Padding(
        //   padding: EdgeInsets.only(left: 16, right: 16),
        //   child: Text(
        //       "Lorem ipsum dolor sit amet consectetur. Quis amet ullamcorper risus mauris nunc et libero felis ipsum et quis pharetra scelerisque."),
        // )
      ],
    );
  }
}
