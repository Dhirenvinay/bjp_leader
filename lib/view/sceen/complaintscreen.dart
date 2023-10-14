import 'dart:io';
import 'package:bjp_leader/controller/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ComplaintForm extends StatefulWidget {
  const ComplaintForm({super.key});

  @override
  State<ComplaintForm> createState() => _ComplaintFormState();
}

class _ComplaintFormState extends State<ComplaintForm> {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedComplaintType;
  TextEditingController _message = TextEditingController();
  //String _message = '';
  String? fileName;
  HomePageController homePageController = Get.put(HomePageController());

  List<String> _complaintTypes = [
    'Public Issues',
    'Private Issues',
    //'D',
    'Other Issues',
  ];
  File? _image;

  bool loading = false;
  bool buttonloading = false;

  Future _getImage() async {
    setState(() {
      loading = true;
    });

    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        loading = false;
      });
    } else {
      setState(() {
        loading = false;
      });
    }
  }

  // void _resetForm() {
  //   if (=) {
  //     setState(() {
  //       _selectedComplaintType = null;
  //       _message.clear();
  //       _image = null;
  //     });
  //   }
  // }

  void _resetForm() {
    setState(() {
      _selectedComplaintType = null;
      _message.clear();
      _image = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xfff77a1d), Color(0xffeeb842)],
          )),
        ),
        //backgroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text('Complaint Form'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: _selectedComplaintType,
                items: _complaintTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type, // Ensure each value is unique
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedComplaintType = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Complaint Type',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                ),
                // validator: (value) {
                //   if (value == null || value.isEmpty) {
                //     Get.snackbar(
                //         "Cmplaint Type", "Kindly Select Complaint Type",
                //         forwardAnimationCurve: Curves.bounceInOut,
                //         reverseAnimationCurve: Curves.bounceInOut,
                //         titleText: const Text(
                //           "Complaint Type",
                //           style: TextStyle(color: Colors.black, fontSize: 20),
                //         ),
                //         messageText: const Text(
                //           "Kindly Select Complaint Type",
                //           style: TextStyle(color: Colors.black, fontSize: 17),
                //         ));

                //     // return 'Please select a complaint type';
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _message,
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Message',

                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  //  floatingLabelAlignment: FloatingLabelAlignment.start,
                  // alignLabelWithHint: ,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.black,
                      )),
                ),
                // onChanged: (value) {
                //   setState(() {
                //     _message = value;
                //   });
                // },
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     // Get.snackbar("Message", "Kindly drop your message",
                //     //     forwardAnimationCurve: Curves.bounceInOut,
                //     //     reverseAnimationCurve: Curves.bounceInOut,
                //     //     titleText: const Text(
                //     //       "Message",
                //     //       style: TextStyle(color: Colors.black, fontSize: 20),
                //     //     ),
                //     //     messageText: const Text(
                //     //       "Kindly drop your message",
                //     //       style: TextStyle(color: Colors.black, fontSize: 17),
                //     //     ));

                //     // return 'Please enter a message';
                //   }
                //   return null;
                // },
              ),
              const SizedBox(height: 16.0),
              GestureDetector(
                onTap: _getImage,
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: loading
                      ? const Center(child: CircularProgressIndicator())
                      : _image != null
                          ? Image.file(_image!,
                              width: 120.0, height: 120.0, fit: BoxFit.fill)
                          : Center(
                              child: Icon(
                                Icons.camera_alt,
                                size: 60.0,
                              ),
                            ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  AbsorbPointer(
                    absorbing:
                        buttonloading, // Disable user interaction when buttonloading is true
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      onPressed: _selectedComplaintType != null &&
                              !_message.text.isEmpty &&
                              _image != null
                          ? () async {
                              setState(() {
                                buttonloading = true;
                              });
                              // Your request logic here
                              final bool success =
                                  await homePageController.sendComplaint(
                                      _selectedComplaintType.toString(),
                                      _message.text,
                                      _image);
                              if (success) {
                                Get.snackbar("Complaint",
                                    "Your Complaint is submit successfully",
                                    forwardAnimationCurve: Curves.bounceInOut,
                                    reverseAnimationCurve: Curves.bounceInOut,
                                    backgroundColor: Colors.black,
                                    titleText: const Text(
                                      "Complaint",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    messageText: const Text(
                                      "Your Complaint is submitted successfully",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ));
                                _resetForm();
                                setState(() {
                                  buttonloading = false;
                                });
                              } else {
                                Get.snackbar("Complaint",
                                    "Something Went Wrong Try Again Later",
                                    forwardAnimationCurve: Curves.bounceInOut,
                                    reverseAnimationCurve: Curves.bounceInOut,
                                    backgroundColor: Colors.black,
                                    titleText: const Text(
                                      "Complaint",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    messageText: const Text(
                                      "Something Went Wrong Try Again Later",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 17),
                                    ));
                              }
                              setState(() {
                                buttonloading = false;
                              });
                            }
                          : null,
                      child: Text(
                        'Submit Complaint',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  if (buttonloading)
                    CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                ],
              )

              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.black,
              //   ),
              //   onPressed: _selectedComplaintType != null &&
              //           !_message.text.isEmpty &&
              //           _image != null
              //       ? () async {
              //           final success = await homePageController.sendComplaint(
              //               _selectedComplaintType.toString(),
              //               _message.text,
              //               _image);
              //           if (success) {
              //             Get.snackbar("Complaint",
              //                 "Your Complaint is submit successfully",
              //                 forwardAnimationCurve: Curves.bounceInOut,
              //                 reverseAnimationCurve: Curves.bounceInOut,
              //                 backgroundColor: Colors.black,
              //                 titleText: const Text(
              //                   "Complaint",
              //                   style: TextStyle(
              //                       color: Colors.white, fontSize: 20),
              //                 ),
              //                 messageText: const Text(
              //                   "Your Complaint is submitted successfully",
              //                   style: TextStyle(
              //                       color: Colors.white, fontSize: 17),
              //                 ));
              //             _resetForm();
              //           } else {
              //             Get.snackbar("Complaint",
              //                 "Something Went Wrong Try Again Later",
              //                 forwardAnimationCurve: Curves.bounceInOut,
              //                 reverseAnimationCurve: Curves.bounceInOut,
              //                 backgroundColor: Colors.black,
              //                 titleText: const Text(
              //                   "Complaint",
              //                   style: TextStyle(
              //                       color: Colors.white, fontSize: 20),
              //                 ),
              //                 messageText: const Text(
              //                   "Something Went Wrong Try Again Later",
              //                   style: TextStyle(
              //                       color: Colors.white, fontSize: 17),
              //                 ));
              //           }
              //         }
              //       : null,
              //   child: Text(
              //     'Submit Complaint',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
