import 'package:flutter/material.dart';

class ReusedBioData extends StatelessWidget {
  ReusedBioData({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xc4f5821f)))
        ],
      ),
    );
  }
}
