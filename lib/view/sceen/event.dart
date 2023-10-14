import 'package:bjp_leader/model/modellist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_page.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  HomePageController homePageController = Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Event",
                style: TextStyle(fontSize: 45),
              ),
            )
          ]),
      // body: ListView.builder(
      //     itemCount: PersonalDataList.modellist.length,
      //     itemBuilder: (context, index) {
      //       var persondata = PersonalDataList.modellist[index];
      //       return TestWidget(
      //         persondata: persondata,
      //       );
      //     }),
      // // body:
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key, this.persondata});
  final persondata;

  @override
  Widget build(BuildContext context) {
    print(" this is event printing data : $persondata");
    return Column(
      children: [
        Container(
          color: Colors.blue,
          height: 500,
          child: Column(
            children: [
              Text(persondata.sId),
              Text(persondata.name),
              SizedBox(
                height: 300,
                child: ListView.builder(
                    itemCount: persondata.politicalHistory.length,
                    itemBuilder: (context, index) {
                      var workdata = persondata.politicalHistory[index];
                      return Column(
                        children: [
                          Text(workdata.result),
                          Text(workdata.time),
                          Text(workdata.type),
                          Text(workdata.post),
                          Text(workdata.party),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
        // Lis

        // Text(persondata.works[0].title),
        // Text(persondata.works[1].title),
        // Text(persondata.works[3].title)
      ],
    );
  }
}
