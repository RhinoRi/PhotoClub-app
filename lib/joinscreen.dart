import 'package:flutter/material.dart';
import 'package:photoclub_app/BottomNavBar.dart';

import 'package:shared_preferences/shared_preferences.dart';

class JoinScreen extends StatefulWidget {
  @override
  _JoinScreenState createState() => _JoinScreenState();
}

class _JoinScreenState extends State<JoinScreen> {
  final username_controller = TextEditingController();
  final password_controller = TextEditingController();

  SharedPreferences joindata;
  bool newuser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_joined();
  }

  void check_if_already_joined() async {
    joindata = await SharedPreferences.getInstance();
    newuser = (joindata.getBool('join') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => BottomNavScreen()));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    username_controller.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff1d3557),
        ),
        home: Scaffold(
            body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              constraints: BoxConstraints
                  .expand(), //size of background image got shrunk to one side after adding a child ,so i added this code
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.srcOver))),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/project_logo.png",
                  height: 100.0,
                  width: 100.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Stack(
                  children: [
                    Container(
                      height: 350.0,
                      width: 330.0,
                      decoration: BoxDecoration(
                          color: Color(0xfff3a683).withOpacity(0.9),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                "JOIN HERE",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                    color: Color(0xff1d3557)),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text("Welcome To The CLub",
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      fontSize: 16.0,
                                      color: Color(0xff1d3557))),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.name,
                                controller: username_controller,
                                cursorColor: Color(0xff1d3557),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Username',
                                    prefixIcon:
                                        Icon(Icons.account_circle_outlined)),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              TextFormField(
                                obscureText: true,
                                controller: password_controller,
                                cursorColor: Color(0xff1d3557),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Password',
                                    prefixIcon: Icon(Icons.lock_outline)),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              RaisedButton(
                                  child: Text(
                                    "JOIN",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Color(0xff1d3557),
                                  onPressed: () {
                                    String username = username_controller.text;
                                    String password = password_controller.text;

                                    if (username != '' && password != '') {
                                      print('Successful');
                                      joindata.setBool('join', false);
                                      joindata.setString('username', username);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  BottomNavScreen()));
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        )));
  }
}
