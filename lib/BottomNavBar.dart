import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photoclub_app/EditScreen.dart';
import 'package:photoclub_app/HomeScreen.dart';
import 'package:photoclub_app/PortfolioScreen.dart';
import 'package:photoclub_app/TutorialScreen.dart';

class BottomNavScreen extends StatefulWidget {
  BottomNavScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomePageScreen(),
    EditScreen(),
    TutorialScreen(),
    PortfolioFirstScreen()
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
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
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Color(0xff1d3557),
            backgroundColor: Color(0xff1d3557),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Color(0xff1d3557)),
                label: "HOME",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.edit, color: Color(0xff1d3557)),
                label: "EDIT",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_collection, color: Color(0xff1d3557)),
                label: "LEARN",
              ),
              BottomNavigationBarItem(
                icon:
                    Icon(Icons.photo_album_outlined, color: Color(0xff1d3557)),
                label: "PORTFOLIO",
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            onTap: _onItemTap,
            selectedFontSize: 13.0,
            unselectedFontSize: 13.0,
          ),
        ));
  }
}
