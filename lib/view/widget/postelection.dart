import 'package:bjp_leader/controller/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostElectionScreen extends StatelessWidget {
  PostElectionScreen({super.key});
  HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    List<String> dates = [
      "Lost MLA election 2016 - BJP",
      "Won Sarpanch 2017 ",
      "Lorem ipsum dolo",
      "Lorem ipsum dolo",
      "Lorem ipsum dolo",
      "Lorem ipsum dolo",

      //"Mewar - Kota Highway construction",
    ];

    // List of descriptions corresponding to each date
    List<String> descriptions = [
      "Area Sikar, vote count - 32000V Area Sikar, vote count - 32000V Area Sikar, vote count - 32000V Area Sikar, vote count - 32000V",
      "Area Sikar, vote count - 32000V",
      "sit amet consectetur. Quis amet ullamcorper risus mauris nunc et libero felis. sit amet consectetur. Quis amet ullamcorper risus mauris nunc et libero felis. sit amet consectetur. Quis amet ullamcorper risus mauris nunc et libero felis. ",
      "sit amet consectetur. Quis amet ullamcorper risus mauris nunc et libero felis. ",
      "sit amet consectetur. Quis amet ullamcorper risus mauris nunc et libero felis. ",
      "sit amet consectetur. Quis amet ullamcorper risus mauris nunc et libero felis. ",
    ];

    // List of text colors corresponding to each container
    // List<Color> textColors = [
    //   Color(0xff6C4F12).withOpacity(0.80),
    //   Color(0xffAB6133).withOpacity(0.80),
    //   Color(0xff74421C).withOpacity(0.80),
    //   Color(0xff517717).withOpacity(0.80)

    //   // Colors.white,
    //   // Colors.black,
    //   // Colors.white,
    //   // Colors.black,
    // ];

    return Column(
      children: [
        SizedBox(
          height: 300, // Adjust the height as needed
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            //scrollDirection: Axis.vertical,
            itemCount: homePageController.history.length,
            itemBuilder: (BuildContext context, int index) {
              var history = homePageController.history[index];
              // Define colors for containers
              // List<Color> colors = [
              //   Color(0xffFFBE52).withOpacity(0.30),
              //   Color(0xffE27A38).withOpacity(.28),
              //   Color(0xffF08F46).withOpacity(0.28),
              //   Color(0xffAAD667).withOpacity(0.30),
              //   // Colors.orange.shade100,
              // ];

              // Use modulo operator to loop through colors
              //  Color color = colors[index % colors.length];

              // Get the corresponding text color
              // Color textColor = textColors[index];

              return Container(
                width: double.infinity, // Full width of the screen
                // height: 100,
                decoration: BoxDecoration(
                  // color: Colors.blue,
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 5,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text(
                            "${history.result} ${history.post} election ${history.time} - ${history.party}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Row(
                          children: [
                            Text(
                              "Area ${history.area}, vote count - ${history.voteMargin}V",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "- ${history.voteMargin}V",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          history.type!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
