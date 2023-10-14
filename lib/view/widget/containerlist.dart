import 'package:flutter/material.dart';

class ContainerList extends StatefulWidget {
  @override
  _ContainerListState createState() => _ContainerListState();
}

class _ContainerListState extends State<ContainerList> {
  int selectedIndex = 0; // Initially select the first container

  final List<String> containerTexts = [
    "Boi-data",
    "Work Report",
    "Past Electon",
    "Manifesto",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 42,
      decoration: BoxDecoration(color: Color(0xff2f394b)),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: containerTexts.length,
        separatorBuilder: (context, index) => SizedBox(width: 12),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Container(
                width: 73,
                height: 42,
                decoration: BoxDecoration(
                  color: selectedIndex == index ? Color(0xfff77a1d) : null,
                ),
                child: Center(
                  child: Text(
                    containerTexts[index],
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
