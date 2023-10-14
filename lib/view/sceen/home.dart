import 'package:bjp_leader/controller/home_page.dart';
import 'package:bjp_leader/view/sceen/complaintscreen.dart';
import 'package:bjp_leader/view/sceen/suggestionform.dart';
import 'package:bjp_leader/view/widget/builder.dart';
import 'package:bjp_leader/view/widget/gride.dart';
import 'package:bjp_leader/view/widget/secondbuilder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomePageController find = Get.find();

  // final List<String> imageUrls = [
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(" the height is ${height} and the width is ${width}");
    return Scaffold(
        body: Obx(() => find.loading.value == true
            ? SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        // constraints: BoxConstraints.expand(),
                        //color: Colors.blue,
                        width: double.infinity,
                        height: 454,
                        child: CachedNetworkImage(
                          imageUrl: homePageController.heroBannerUrl.value,
                          fit: BoxFit.cover,
                          width: 232.58688354492188,
                          height: 454,
                          // placeholder: (context, url) =>
                          //     CircularProgressIndicator(), // Placeholder while the image is loading
                          // errorWidget: (context, url, error) => Icon(Icons
                          //     .error), // Widget to display in case of an error
                        )

                        // child: Image.asset(
                        //   persondata.heroBanner!,
                        //   fit: BoxFit.cover,
                        //   width: 232.58688354492188,
                        //   height: 346.8399963378906,
                        // ),
                        ),

                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      width: width * 0.93,
                      height: 100,
                      //  height: 76,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: const Color(0xe5f67c21)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              // color: Colors.blue,
                              width: MediaQuery.of(context).size.width * 0.65,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, top: 10),
                                    child: Text(
                                        homePageController
                                            .featureCard.value.heading!,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5, top: 5),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          homePageController
                                              .featureCard.value.subHeading!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => launchUrl(Uri.parse(
                                  homePageController
                                      .featureCard.value.action!)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 75,
                                    height: 23,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: const Color(0xff44465b),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black
                                              .withOpacity(0.2), // Shadow color
                                          spreadRadius: 0, // Spread radius
                                          blurRadius: 5, // Blur radius
                                          offset: const Offset(0,
                                              2), // Offset in the x and y direction
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        homePageController
                                            .featureCard.value.actionLabel!,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                        //  textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Contribution in Education",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 16,
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: VideoListWithPlayButton(
                          youtubedata: homePageController.featureVideos),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Container(
                        // color: Color(0xc10055ca),
                        // color: Color(0),
                        width: width * 0.95,
                        height: 126,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(homePageController.fc2.value),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: ClipRRect(
                        //   borderRadius: BorderRadius.circular(12),
                        //   child: Image.asset(
                        //     "assets/images/contain.png",
                        //     fit: BoxFit.cover,
                        //   ),
                        // ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Agenda ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridBuilderView(persondata: homePageController.agendaHeads),
                    const SizedBox(
                      height: 5,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Suggest Us",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000))),
                      ),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(() => SuggestionForm()),
                          child: Container(
                            width: width / 2.3,
                            height: 52,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xfff77a1d),
                                    Color(0xffeeb842)
                                  ],
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text("Suggestion",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff000000))),
                                Image.asset(
                                  "assets/icons/Rightarrow.png",
                                  width: 20,
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Get.to(() => ComplaintForm()),
                          child: Container(
                            width: width / 2.3,
                            height: 52,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xfff77a1d),
                                    Color(0xffeeb842)
                                  ],
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text("Complain",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff000000))),
                                Image.asset(
                                  "assets/icons/Rightarrow.png",
                                  width: 20,
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("News",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff000000))),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SecondBuilder(
                          thumb: homePageController.updates,
                        )),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator())));
  }
}
