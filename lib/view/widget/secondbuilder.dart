import 'package:bjp_leader/model/apimodel.dart';
import 'package:flutter/material.dart';

class SecondBuilder extends StatelessWidget {
  SecondBuilder({Key? key, required this.thumb}) : super(key: key);
  final List<Updates> thumb;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: thumb.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            width: 260.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                thumb[index].thumb!,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
