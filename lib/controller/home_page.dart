import 'dart:convert';
import 'dart:io';
import 'package:bjp_leader/model/apimodel.dart';
import 'package:bjp_leader/model/modellist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomePageController extends GetxController {
  var loading = false.obs;
  //var leader = [].obs;
  var heroBannerUrl = "".obs;
  //var fc = "".obs;
  var fc2 = "".obs;
  var featureVideos = <String>[].obs;
  var agendaHeads = <AgendaHeads>[].obs;
  var bio = Bio().obs;
  var featureCard = FeatureCard().obs;
  var updates = <Updates>[].obs;
  var workstats = WorkStats().obs;
  var works = <Works>[].obs;
  var history = <PoliticalHistory>[].obs;
  var present = Present().obs;
  //var works = <WorkStats>[].obs;
  // var youtube = "".obs;

  Future<void> getData() async {
    print("into get method");
    String url =
        "https://w9fy5vk6w3.execute-api.ap-south-1.amazonaws.com/dev/api/public/leader/er-shrawan-choudhary";
    try {
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print("Response code is correct");
        var jsonData = jsonDecode(response.body);

        if (jsonData is Map<String, dynamic>) {
          PersonalDataList.modellist = [PersonData.fromJson(jsonData)];
          heroBannerUrl.value = jsonData["heroBanner"];
          fc2.value = jsonData["featureCard2"]["img"];
          featureCard.value = FeatureCard.fromJson(jsonData["featureCard"]);
          bio.value = Bio.fromJson(jsonData['bio']);
          workstats.value = WorkStats.fromJson(jsonData['workStats']);
          present.value = Present.fromJson(jsonData["present"]);
        }
        if (jsonData["updates"] is List) {
          List<Updates> updateList = (jsonData["updates"] as List)
              .map((item) => Updates.fromJson(item))
              .toList();
          updates.assignAll(updateList);
        }
        // if (jsonData["featureVideos"] is List) {
        //   List<String> youtubeVideoUrls = [];
        //   for (var video in jsonData["featureVideos"]) {
        //     if (video is Map<String, dynamic> &&
        //         video["type"] == "Youtube" &&
        //         video["src"] is String) {
        //       youtubeVideoUrls.add(video["src"]);
        //     }
        //   }
        //   featureVideos.assignAll(youtubeVideoUrls);
        // }

        if (jsonData["featureVideos"] is List) {
          List<String> youtubeVideoUrls = [];
          for (var video in jsonData["featureVideos"]) {
            if (video is Map<String, dynamic> &&
                video["type"] == "Youtube" &&
                video["src"] is String) {
              youtubeVideoUrls.add(video["src"]);
            }
          }
          featureVideos.assignAll(youtubeVideoUrls);
        }
        if (jsonData["works"] is List) {
          List<Works> workslist = (jsonData["works"] as List)
              .map((item) => Works.fromJson(item))
              .toList();

          works.assignAll(workslist);
        }
        if (jsonData["politicalHistory"] is List) {
          List<PoliticalHistory> list = (jsonData["politicalHistory"] as List)
              .map((item) => PoliticalHistory.fromJson(item))
              .toList();

          history.assignAll(list);
        }

        if (jsonData["agendaHeads"] is List) {
          List<AgendaHeads> agendaHeadsData = (jsonData["agendaHeads"] as List)
              .map((item) => AgendaHeads.fromJson(item))
              .toList();

          agendaHeads.assignAll(agendaHeadsData);
        }
        // if (jsonData["bio"] is List) {
        //   List<Bio> biodata = (jsonData["bio"] as List)
        //       .map((item) => Bio.fromJson(item))
        //       .toList();

        //   bio.assignAll(biodata);
        // }

        loading.value = true;
      } else {
        Get.snackbar("Error", "Status Code is not 200");
      }
    } catch (e) {
      print("Error during the network request: $e");
    }
  }

  Future<bool> sendComplaint(
      String complaintType, String message, File? imageFile) async {
    final url = Uri.parse(
        'https://crudcrud.com/api/5cd15db5f4444da0b4729040f359e979/complain');
    final data = {
      'complaint_type': complaintType,
      'message': message,
      'image': imageFile != null
          ? base64Encode(await imageFile.readAsBytes())
          : null,
    };

    try {
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        print('Complaint sent successfully');
        return true;
      } else {
        // Get.snackbar("Complaint", "Something Went Wrong",
        //     forwardAnimationCurve: Curves.bounceInOut,
        //     reverseAnimationCurve: Curves.bounceInOut,
        //     backgroundColor: Colors.black,
        //     titleText: const Text(
        //       "Complaint",
        //       style: TextStyle(color: Colors.white, fontSize: 20),
        //     ),
        //     messageText: const Text(
        //       "Your Complaint is submitted successfully",
        //       style: TextStyle(color: Colors.white, fontSize: 17),
        //     ));
        print('Error: ${response.reasonPhrase}');
      }

      return false;
      ;
    } catch (e) {
      print('Error sending complaint: $e');
      return false;
    }
  }

  // Future<void> sendComplaint(
  //     String complaintType, String message, File? imageFile) async {
  //   // The URL for the POST request
  //   final url = Uri.parse(
  //       'https://crudcrud.com/api/5cd15db5f4444da0b4729040f359e979/complain');

  //   try {
  //     // Create a multipart request
  //     var request = http.MultipartRequest('POST', url);

  //     // Add the complaint type field
  //     request.fields['complaint_type'] = complaintType;

  //     // Add the message field
  //     request.fields['message'] = message;

  //     // Add the image field (if an image is provided)
  //     if (imageFile != null) {
  //       var stream = http.ByteStream(imageFile.openRead());
  //       var length = await imageFile.length();
  //       var multipartFile = http.MultipartFile('image', stream, length,
  //           filename: 'complaint_image.jpg'); // You can change the filename

  //       // Add the image to the request
  //       request.files.add(multipartFile);
  //     }

  //     // Send the request
  //     var response = await request.send();

  //     // Check if the response status code is 200 (OK)
  //     if (response.statusCode == 200) {
  //       print('Complaint sent successfully');
  //     } else {
  //       print('Error: ${response.reasonPhrase}');
  //     }
  //   } catch (e) {
  //     print('Error sending complaint: $e');
  //   }
  // }

  // ... (other methods)

  @override
  void onReady() {
    super.onReady();
    print("OnReady Calling");
    getData();
  }
}
