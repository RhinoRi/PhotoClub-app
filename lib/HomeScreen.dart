import 'package:flutter/material.dart';
import 'package:photoclub_app/joinscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  double height = 100;

  SharedPreferences joindata;
  String username;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    joindata = await SharedPreferences.getInstance();
    setState(() {
      username = joindata.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff1d3557),
        ),
        home: Scaffold(
            backgroundColor: Color(0xff1d3557),
            appBar: AppBar(
              title: Text(
                'PHOTOCLUB',
                style: TextStyle(fontSize: 20),
              ),
              elevation: 0,
              actions: [
                IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      return showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: new Text("Do you wish to leave ? "),
                            content:
                                new Text("This will take you to Join Screen"),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("DisJoin"),
                                onPressed: () {
                                  joindata.setBool('join', true);
                                  Navigator.pushReplacement(
                                      context,
                                      new MaterialPageRoute(
                                          builder: (context) => JoinScreen()));
                                },
                              ),
                            ],
                          );
                        },
                      );
                    })
              ],
            ),
            body: Container(
              constraints: BoxConstraints
                  .expand(), //size of background image got shrunk to one side after adding a child ,so i added this code
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/wallpapar.jpg"),
                fit: BoxFit.cover,
                // colorFilter: ColorFilter.mode(
                //     Colors.black.withOpacity(0.4), BlendMode.srcOver)
              )),

              child: Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset("assets/images/clicking_camera.png",
                    height: 200.0),
              ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: TweenAnimationBuilder(
              //     duration: Duration(seconds: 4),
              //     tween: Tween<double>(begin: 100, end: height),
              //     builder: (_, value, child) => Align(
              //         alignment: Alignment.bottomRight,
              //         child: Image.asset("assets/images/clicking_camera.png",
              //             height: value)),
              //     onEnd: () {
              //       setState(() {
              //         height = height == 100 ? 200 : 100;
              //       });
              //     },
              //   ),
              // ),
            )));
  }
}
