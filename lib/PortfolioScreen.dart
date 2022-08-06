import 'dart:io';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

class PortfolioScreen extends StatefulWidget {
  final List arguments;
  PortfolioScreen({this.arguments});
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  List _images = [];
  File photos;
  final picker = ImagePicker();

  choosePhotos() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Collections"),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StaggeredGridView.countBuilder(
              scrollDirection: Axis.vertical,
              crossAxisCount: 4,
              itemCount: _images.length + 1,
              itemBuilder: (BuildContext context, index) {
                return index == _images.length
                    ? GestureDetector(
                        onTap: () {
                          choosePhotos();
                        },
                        child: Container(
                          child: DottedBorder(
                            color: Colors.grey,
                            strokeWidth: 2,
                            radius: Radius.circular(4),
                            child: ClipRRect(
                              child: Container(
                                width: double.infinity,
                                height: double.infinity,
                                child: Icon(
                                  Icons.add_photo_alternate_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          image: DecorationImage(
                            image: FileImage(_images[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
              },
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 2 : 1),
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
          ),
        ));
  }
}

class PortfolioFirstScreen extends StatefulWidget {
  final List arguments;
  PortfolioFirstScreen({this.arguments});
  @override
  _PortfolioFirstScreenState createState() => _PortfolioFirstScreenState();
}

class _PortfolioFirstScreenState extends State<PortfolioFirstScreen> {
  String emailaddr;
  String urladdr;

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.indigo[200],
        appBar: AppBar(
          title: Text("My Portfolio"),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                fit: StackFit.expand,
                overflow: Overflow.visible,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: ClipOval(
                      child: (_image != null)
                          ? Image.file(_image)
                          : Image.asset('assets/images/profilepic.jpg'),
                    ),
                  ),
                  Positioned(
                    right: -16,
                    bottom: 0,
                    child: SizedBox(
                      height: 46,
                      width: 46,
                      child: IconButton(
                        icon: Icon(Icons.add),
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(50),
                        //   side: BorderSide(color: Colors.white),
                        // ),
                        color: Colors.black,
                        onPressed: () {
                          getImage();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "My Details :",
                  style: TextStyle(fontSize: 20.0),
                )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onSaved: (newValue) => emailaddr = newValue,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onSaved: (newValue) => urladdr = newValue,
                keyboardType: TextInputType.url,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Link',
                    prefixIcon: Icon(Icons.web_outlined)),
              ),
            ),
            RaisedButton(
                color: Colors.lightBlueAccent,
                child: Text(
                  'My Collections',
                  style: TextStyle(color: Color(0xff1d3557)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PortfolioScreen()),
                  );
                })
          ],
        ));
  }
}
