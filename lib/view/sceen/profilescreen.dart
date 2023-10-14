import 'package:bjp_leader/controller/home_page.dart';
import 'package:bjp_leader/view/widget/biodata.dart';
import 'package:bjp_leader/view/widget/manifesto.dart';
import 'package:bjp_leader/view/widget/postelection.dart';
import 'package:bjp_leader/view/widget/workreport.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);
  HomePageController homePageController = Get.put(HomePageController());

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 0;
  final List<String> containerTexts = [
    "Boi-data",
    "Work Report",
    "Past Electon",
    "Manifesto",
  ];
  bool like = false;
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 275,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xfff77a1d), Color(0x33bf793e)],
              ),
            ),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  // color: Colors.blue,
                  width: MediaQuery.of(context).size.width / 2.25,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Image.asset(
                            "assets/images/logo.png",
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16.0),
                          child: Text(
                            homePageController.bio.value.name!,
                            //   "Sharwan Choudhry",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 0.9),
                            maxLines: 2,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: Color(0xff2f394b),
                            ),
                            Text(
                              "${homePageController.present.value.area!}, ${homePageController.present.value.state}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Color(0xff2f394b),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  like = !like;
                                });

                                // print("Working");
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: const Color(0xff2f394b),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black
                                          .withOpacity(0.5), // Shadow color
                                      spreadRadius:
                                          2, // Spread radius of the shadow
                                      blurRadius:
                                          4, // Blur radius of the shadow
                                      offset: const Offset(0,
                                          2), // Offset of the shadow (0, 2) will give a shadow below
                                    ),
                                    // BoxShadow(
                                    //   color: Colors.black.withOpacity(
                                    //       0.2), // Another shadow for right side
                                    //   spreadRadius: 2,
                                    //   blurRadius: 4,
                                    //   offset:
                                    //       Offset(4, 0), // Offset to the right
                                    // ),
                                  ],
                                ),
                                child: Icon(
                                  like
                                      ? Icons.thumb_up
                                      : Icons.thumb_up_alt_outlined,
                                  color: const Color(0xe5fefefe),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "3200",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text(
                              "Like",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Image.asset(
                        "assets/images/leader.png",
                        height: 184,
                        width: 124,
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius:
                                      2, // Spread radius of the shadow
                                  blurRadius: 4, // Blur radius of the shadow
                                  offset: const Offset(0,
                                      2), // Offset of the shadow (0, 2) will give a shadow below
                                ),
                                BoxShadow(
                                  color: Colors.grey.withOpacity(
                                      0.2), // Another shadow for right side
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset:
                                      const Offset(4, 0), // Offset to the right
                                ),
                              ],
                            ),
                            child: Container(
                              width: 87.50000762939453,
                              height: 42,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8).copyWith(
                                    topRight: Radius.zero,
                                    bottomRight: Radius.zero),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    "assets/images/logo.png",
                                    width: 27.999998092651367,
                                    height: 27.999998092651367,
                                  ),
                                  Text(
                                    homePageController.present.value.party!,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 80,
                            height: 42,
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              //  color: Colors.white,
                              borderRadius: BorderRadius.circular(8).copyWith(
                                  topLeft: Radius.zero,
                                  bottomLeft: Radius.zero),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.5), // Shadow color
                                  spreadRadius:
                                      2, // Spread radius of the shadow
                                  blurRadius: 4, // Blur radius of the shadow
                                  offset: const Offset(0,
                                      2), // Offset of the shadow (0, 2) will give a shadow below
                                ),
                                BoxShadow(
                                  color: Colors.grey.withOpacity(
                                      0.2), // Another shadow for right side
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset:
                                      const Offset(4, 0), // Offset to the right
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "${homePageController.present.value.electionType!} ${homePageController.present.value.state}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, height: 1.1),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      )

                      // Image.asset("assets/images/cont.png"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 42,
            decoration: const BoxDecoration(color: Color(0xff2f394b)),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: containerTexts.length,
              // separatorBuilder: (context, index) => SizedBox(width: 5),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      // width: 100,
                      height: 42,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? const Color(0xfff77a1d)
                            : null,
                      ),
                      child: Center(
                        child: Text(
                          containerTexts[index],
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              // color: Colors.blue,
              //height: double.infinity, // Adjust the height as needed
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: selectedIndex == 0
                      ? BioData()
                      : selectedIndex == 1
                          ? WorkReportScreen()
                          : selectedIndex == 2
                              ? PostElectionScreen()
                              : const ManifestoScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
