import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photoclub_app/PhotoEditScreen.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  File _image;
  final picker = ImagePicker();

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
    Future.delayed(Duration(seconds: 0)).then(
      (value) => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => EditPhotoScreen(
            arguments: [_image],
          ),
        ),
      ),
    );
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
    Future.delayed(Duration(seconds: 0)).then(
      (value) => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => EditPhotoScreen(
            arguments: [_image],
          ),
        ),
      ),
    );
  }

  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Options"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Open Camera"),
                    onTap: () {
                      getImageFromCamera();
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  GestureDetector(
                    child: Text("Open Gallery"),
                    onTap: () {
                      getImageFromGallery();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      body: Center(
        child: Container(
          child: RaisedButton(
            onPressed: () {
              showOptionsDialog(context);
            },
            child: Text(
              "SELECT AN IMAGE ",
              style: TextStyle(color: Colors.white),
            ),
            color: Color(0xff1d3557),
          ),
        ),
      ),
    );
  }
}

// SizedBox(
//   height: 15.0,
// ),
// // Container(
// //   height: 300.0,
// //   width: 500.0,
// //   child: _image == null
// //       ? Center(
// //           child: Text("No image Selected..!",
// //               style: TextStyle(color: Colors.white70)))
// //       : Image.file(_image),
// // ),
// SizedBox(
//   height: 60.0,
// ),
