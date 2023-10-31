import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/activity.dart';
import 'package:flutter_application_2/screens/friends.dart';
import 'package:flutter_application_2/screens/goals.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedItem = 0;

  static const List<Widget> _widgetOption = <Widget>[
    Goals(),
    Activity(),
    Friends(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOption.elementAt(_selectedItem),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 30.0, // Soften the shadow
              spreadRadius: 5.0, // Extend the shadow
              offset: Offset(
                0.0, // Move to right 10 horizontally
                10.0, // Move to bottom 10 vertically
              ),
            )
          ],
        ),
        child: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: const Color.fromRGBO(239, 108, 0, 1)),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.trending_up,
                  size: 35,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.radio_button_checked,
                  size: 35,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 35,
                ),
                label: "")
          ],
          currentIndex: _selectedItem,
          selectedItemColor: Colors.indigo,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
