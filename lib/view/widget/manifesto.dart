import 'package:flutter/material.dart';

class ManifestoScreen extends StatelessWidget {
  const ManifestoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> dates = [
      "Mewar - Kota Highway construction",
      "Mewar - Kota Highway construction",
      "Mewar - Kota Highway construction",
      "Mewar - Kota Highway construction",
    ];
    List<String> descriptions = [
      "Lorem ipsum dolor sit amet consectetur. Quis amet ullamcorper risus mauris nunc et libero felis ",
      "Lorem ipsum dolor sit amet consectetur. Quis amet ullamcorper risus mauris nunc et libero felis ",
      "Lorem ipsum dolor sit amet consectetur. Quis amet ullamcorper risus mauris nunc et libero felis ",
      "Lorem ipsum dolor sit amet consectetur. Quis amet ullamcorper risus mauris nunc et libero felis ",
    ];
    List<Color> textColors = [
      const Color(0xff6C4F12).withOpacity(0.80),
      const Color(0xffAB6133).withOpacity(0.80),
      const Color(0xff74421C).withOpacity(0.80),
      const Color(0xff517717).withOpacity(0.80)
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 500,
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            //scrollDirection: Axis.vertical,
            itemCount: dates.length,
            itemBuilder: (BuildContext context, int index) {
              // Define colors for containers
              List<Color> colors = [
                const Color(0xffFFBE52).withOpacity(0.30),
                const Color(0xffE27A38).withOpacity(.28),
                const Color(0xffF08F46).withOpacity(0.28),
                const Color(0xffAAD667).withOpacity(0.30),
                // Colors.orange.shade100,
              ];
              Color color = colors[index % colors.length];
              Color textColor = textColors[index];

              return Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${dates[index]}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "${descriptions[index]}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
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
