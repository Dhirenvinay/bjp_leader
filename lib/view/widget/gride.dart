import 'package:bjp_leader/controller/home_page.dart';
import 'package:bjp_leader/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridBuilderView extends StatefulWidget {
  const GridBuilderView({super.key, required this.persondata});
  final persondata;

  @override
  State<GridBuilderView> createState() => _GridBuilderViewState();
}

class _GridBuilderViewState extends State<GridBuilderView> {
  bool isExpanded = false;
  HomePageController homePageController = Get.put(HomePageController());

  final List<Map<String, dynamic>> items = [
    {"text": "Education", "icon": Icons.school, "color": Colors.red},
    {"text": "Health", "icon": Icons.local_hospital, "color": Colors.blue},
    {"text": "Development", "icon": Icons.work, "color": Colors.green},
    {"text": "Agricultural", "icon": Icons.eco, "color": Colors.orange},
    {"text": "Economic", "icon": Icons.attach_money, "color": Colors.purple},
    {"text": "Cultural", "icon": Icons.palette, "color": Colors.teal},
    {"text": "Women Empo..", "icon": Icons.woman, "color": Colors.brown},
    {"text": "More", "icon": Icons.more_horiz, "color": Colors.grey},
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double itemHeight = width * 0.18;
    //int numberOfRows = (items.length / 4).ceil();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          //  height: itemHeight * numberOfRows,
          height: 180,
          child: Container(
            //color: Colors.blue,
            constraints: const BoxConstraints.expand(),
            child: GridView.builder(
              padding: const EdgeInsets.all(5),
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.4,
                mainAxisSpacing: 0,
                crossAxisSpacing: 5,
              ),
              itemCount: widget.persondata.length,
              itemBuilder: (BuildContext context, int index) {
                var head = widget.persondata[index];
                //  String iconName = head.icon;
                int codePoint =
                    int.parse(head.icon); // Replace with your integer value
                IconData customIcon =
                    IconData(codePoint, fontFamily: 'MaterialIcons');
                // print("Data: ${widget.persondata}");
                return InkWell(
                  // splashColor: Colors.,
                  onTap: () {
                    if (index == widget.persondata.length - 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MainScreen(index: 2),
                        ),
                      );
                      // Get.to(() => const MainScreen(
                      //       index: 2,
                      //     ));
                      print("Last icon clicked");
                    } else {
                      print("Other icon clicked: ${head.heading}");
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        customIcon,
                        size: 32,
                        color: Color(int.parse(head.color)),
                      ),
                      const SizedBox(height: 5),
                      Expanded(
                        child: Text(
                          head.heading,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
