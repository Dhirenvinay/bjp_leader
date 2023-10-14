import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SuggestionForm extends StatefulWidget {
  @override
  _SuggestionFormState createState() => _SuggestionFormState();
}

class _SuggestionFormState extends State<SuggestionForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _selectedSuggestionType;
  String _message = '';
  String? fileName;
  // bool suggestion = false;
  // bool message = false;

  List<String> suggestionTypes = [
    'Public Suggestion',
    'Private Suggestion',
    //'D',
    'Other Suggestion',
  ];
  File? _image;

  Future _getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
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
        title: Text('Suggestion Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DropdownButtonFormField<String>(
                value: _selectedSuggestionType,
                items: suggestionTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type, // Ensure each value is unique
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedSuggestionType = value;
                    //  suggestion = true;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Suggestion Type',
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
                //     // Get.snackbar(
                //     //     "Suggestion Type", "Kindly Select Suggestion Type",
                //     //     forwardAnimationCurve: Curves.bounceInOut,
                //     //     reverseAnimationCurve: Curves.bounceInOut,
                //     //     titleText: const Text(
                //     //       "Suggestion Type",
                //     //       style: TextStyle(color: Colors.black, fontSize: 20),
                //     //     ),
                //     //     messageText: const Text(
                //     //       "Kindly Select Suggestion Type",
                //     //       style: TextStyle(color: Colors.black, fontSize: 17),
                //     //     ));
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                maxLines: 4,
                decoration: InputDecoration(
                  labelText: 'Message',
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
                onChanged: (value) {
                  setState(() {
                    //  message = true;
                    _message = value;
                  });
                },
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     // return 'Please enter a message';
                //   }
                //   return null;
                // },
              ),
              SizedBox(height: 16.0),
              GestureDetector(
                onTap: _getImage,
                child: Container(
                  width: 150.0, // Set the desired width
                  height: 150.0, // Set the desired height
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: Colors.black), // Add a border for the container
                  ),
                  child: _image != null
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                onPressed: _selectedSuggestionType != null && _message != ''
                    ? () {
                        // if (_formKey.currentState!.validate()) {
                        //   // Process the complaint form data here
                        //   // You can access _selectedSuggestionType and _message
                        //   print('Complaint Type: $_selectedSuggestionType');
                        //   print('Message: $_message');
                        // }
                      }
                    : null,
                child: Text(
                  'Submit Suggestion',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickFile() async {
    final res = await FilePicker.platform.pickFiles();
    if (res != null) {
      setState(() {
        fileName = res.files.first.name;
      });
    }
  }
}
