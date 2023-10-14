import 'package:bjp_leader/controller/home_page.dart';
import 'package:bjp_leader/view/widget/rebusedbiodata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BioData extends StatelessWidget {
  BioData({
    super.key,
  });
  HomePageController homePageController = Get.put(HomePageController());

//  String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReusedBioData(text: homePageController.bio.value.name!),
        ReusedBioData(text: "Gender : ${homePageController.bio.value.gender}"),
        ReusedBioData(text: "Age : ${homePageController.bio.value.dob}"),
        //    : Text("Fetching from API"),
        ReusedBioData(
            text: "Profession : ${homePageController.bio.value.profession}"),
        ReusedBioData(
            text: "Education : ${homePageController.bio.value.education}"),
        // ReusedBioData(text: "Party : BJP"),
        // ReusedBioData(text: "Candidate for : MLA"),
        // ReusedBioData(text: "Election Constituency : Fatehpur"),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
