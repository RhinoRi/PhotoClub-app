import 'package:flutter/material.dart';
import 'package:photoclub_app/joinscreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff1d3557),
        ),
        home: Scaffold(
            //backgroundColor: Colors.indigo[900],
            body: Container(
                constraints: BoxConstraints
                    .expand(), //size of background image got shrunk to one side after adding a child ,so i added this code
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/background.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.srcOver))),
                // height: double.infinity,
                // width: double.infinity,
                // decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //   begin: Alignment.bottomLeft,
                //   end: Alignment.topRight,
                //   stops: [0.2, 0.5, 0.8],
                //   colors: [
                //     Color(0xff1d3557),
                //     Colors.indigo[300],
                //     Colors.deepPurple[300]
                //   ],
                // )),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40.0,
                      ),
                      Image.asset(
                        "assets/images/project_logo.png",
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text("WELCOME TO  PHOTOCLUB",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              color: Colors.white)),
                      Text("A perfect club for beginners...",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.white)),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JoinScreen()));
                          },
                          child: Text("GET STARTED",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          color: Color(0xff1d3557),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
