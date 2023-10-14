import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingListPage extends StatefulWidget {
  const LoadingListPage({super.key});

  @override
  State<LoadingListPage> createState() => _LoadingListPageState();
}

class _LoadingListPageState extends State<LoadingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shimmer Example'),
      ),
      body: Center(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: 200,
            height: 100,
            color: Colors.grey, // Placeholder color
          ),
        ),
      ),
    );
  }
}
