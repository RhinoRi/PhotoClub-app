import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:photoclub_app/welcomescreen.dart';

void main() {
  runApp(PhotoClub());
}

class PhotoClub extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhotoCLub App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroPage(
        title: "Photo Club",
      ),
    );
  }
}

class IntroPage extends StatefulWidget {
  IntroPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  @override
  void initState() {
    // TODO: implement initState
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      padding: EdgeInsets.all(50.0),
      color: Color(0xff1d3557),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/create_edit.png"),
          Text("Create and Edit",
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text(
            "Your Creativity space is here.",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w100,
                color: Colors.white),
          )
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.all(50.0),
      color: Color(0xfff9844a),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/tutorial.png"),
          Text("Watch and Learn",
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text(
            "Learning and Enhancing your creativity is essential.",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w100,
                color: Colors.white),
          )
        ],
      ),
    ),
    Container(
      padding: EdgeInsets.all(50.0),
      color: Color(0xff588157),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset("assets/images/portfolio.png"),
          Text("Build your portfolio",
              style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text(
            "Showcase your awesome work collection.",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w100,
                color: Colors.white),
          ),
        ],
      ),
    )
  ];
  Widget _buildDots(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return Container(
      width: 20,
      child: Center(
        child: Material(
          color: Colors.deepOrange,
          type: MaterialType.card,
          child: Container(
            width: 6.0 * zoom,
            height: 6.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
              pages: pages,
              enableLoop: true,
              slideIconWidget: Icon(
                Icons.arrow_back_ios,
                color: Colors.deepOrange,
              ),
              enableSlideIcon: true,
              fullTransitionValue: 600,
              ignoreUserGestureWhileAnimating: true,
              onPageChangeCallback: pageChangeCallback),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Expanded(child: SizedBox()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(pages.length, _buildDots),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomeScreen()),
                  );
                  liquidController.animateToPage(
                      page: pages.length - 1, duration: 500);
                },
                child: Text(
                  "Skip ",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.white.withOpacity(0.01),
              ),
            ),
          )
        ],
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
